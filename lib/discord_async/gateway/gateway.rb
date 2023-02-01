require 'uri'
require 'async'
require 'async/http'
require 'async/websocket'
require 'logger'

require_relative '../event_observer'
require_relative '../observer'
require_relative 'opcodes'

module DiscordAsync
  class Gateway
    module EncodingTypes
      JSON = :json
    end

    Identify = Data.define(:token, :properties, :compress, :large_threshold, :shard, :presence, :intents) do
      Properties = Data.define(:os, :browser, :device)

      def initialize(token:, properties:, intents:, compress: false, large_threshold: 50, shard: nil, presence: nil)
        super(token:, properties: Properties[**properties], compress:, large_threshold:, shard:, presence:, intents:)
      end

      def to_h
        super.tap do |hash|
          hash[:properties] = properties.to_h
        end
      end
    end

    attr_reader :event_observer, :event_repeater

    def initialize(token)
      @token = token
      @event_observer = EventObserver.new
      @logger = Logger.new(STDOUT)

      @event_repeater = Observer.new
    end

    def start(raw_url, version, encoding, identify_data)
      identify_data = Identify[**identify_data]

      Async do
        started = Async::Condition.new

        establish_connection(form_connection_url(raw_url, version, encoding, identify_data.compress))

        Async do
          e = catch_hello_event.wait
          start_heart_beat_loop(e['d']['heartbeat_interval'] / 1000.0)
        end

        send_identify identify_data

        Async do
          e = catch_ready_event.wait
          pp e
          started.signal e
        end

        start_receive_messages
        started.wait
      end.wait
    end

    def stop
      @connection.close

      @logger.debug 'stop ended'
    end

    def send_voice_state_update(guild_id, channel_id, self_mute: false, self_deaf: false)
      @connection.write({ op: 4, d: { guild_id:, channel_id:, self_mute:, self_deaf: } }.to_json)
      @connection.flush
    end

    private

    def form_connection_url(raw_url, version, encoding, compress)
      "#{URI(raw_url).scheme}://#{URI(raw_url).host}?v=#{version}&encoding=#{encoding}#{compress ? '&compress=zlib-stream' : ''}"
    end

    def establish_connection(url, ws_client: Async::WebSocket::Client)
      endpoint = Async::HTTP::Endpoint.parse url, alpn_protocols: Async::HTTP::Protocol::HTTP11.names
      @connection = ws_client.connect endpoint
    end

    def start_receive_messages
      Async do
        while (msg = @connection.read)
          e = JSON.parse(msg)
          pp e

          event_observer.notify e
          event_repeater.notify e
        end
        @logger.debug 'start_receive_messages ended'
      end
    end

    def catch_hello_event
      condition = Async::Condition.new

      event_observer.subscribe opcode: 10, callback: proc { |e| condition.signal e }, once: true

      Async { condition.wait }
    end

    def start_heart_beat_loop(heartbeat_interval)
      Async do
        sleep heartbeat_interval * rand
        send_heart_beat

        until @connection.closed?
          sleep heartbeat_interval
          send_heart_beat
        end
        @logger.debug 'start_heart_beat_loop ended'
      end
    end

    def send_heart_beat
      return if @connection.closed?
      @connection.write({ op: 1, d: nil }.to_json)
      @connection.flush
    end

    def send_identify(identify_data)
      data = {
        op: 2,
        d: identify_data.to_h.compact
      }.to_json

      @connection.write data
      @connection.flush
    end

    def catch_ready_event
      condition = Async::Condition.new

      event_observer.subscribe opcode: 0, event_name: 'READY', callback: proc { |e| condition.signal e }, once: true

      Async { condition.wait }
    end
  end
end
