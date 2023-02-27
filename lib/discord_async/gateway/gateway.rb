# frozen_string_literal: true

require 'async/http'
require 'async/websocket'
require 'uri'
require 'logger'

module DiscordAsync
  module Gateway
    class Gateway
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
        @logger = Logger.new($stdout)

        @event_repeater = Observer.new
      end

      # Public interface life cycle
      def start(raw_url, version, encoding, identify_data)
        identify_data = Identify[**identify_data]

        Async do
          started = Async::Condition.new

          establish_connection(
            form_connection_url(raw_url, version, encoding, identify_data.compress)
          )

          Async do
            start_heart_beat_loop(
              catch_hello_event.d.heartbeat_interval_in_seconds
            )
          end

          send_identify identify_data

          Async { started.signal catch_ready_event }

          start_receive_messages

          started.wait
        end.wait
      end

      def stop
        @connection.close

        @logger.debug 'stop ended'
      end

      # Init
      def establish_connection(url, ws_client: Async::WebSocket::Client)
        endpoint = Async::HTTP::Endpoint.parse url, alpn_protocols: Async::HTTP::Protocol::HTTP11.names
        @connection = ws_client.connect endpoint
      end

      def start_receive_messages
        Async do
          while (msg = @connection.read)
            payload = Payload.new(JSON.parse(msg))
            @logger.debug payload

            event_observer.notify payload
            event_repeater.notify payload
          end
          @logger.debug 'start_receive_messages ended'
        end
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

      # Send
      def send_voice_state_update(guild_id, channel_id, self_mute: false, self_deaf: false)
        @connection.write({ op: 4, d: { guild_id:, channel_id:, self_mute:, self_deaf: } }.to_json)
        @connection.flush
      end

      def send_heart_beat
        return if @connection.closed?

        @connection.write({ op: 1, d: nil }.to_json)
        @connection.flush
      end

      def send_identify(identify_data)
        return if @connection.closed?

        data = {
          op: 2,
          d: identify_data.to_h.compact
        }.to_json

        @connection.write data
        @connection.flush
      end

      # Catch
      def catch_hello_event
        condition = Async::Condition.new

        event_observer.subscribe opcode: 10, callback: proc { |e| condition.signal e }, once: true

        Async { condition.wait }.wait
      end

      def catch_ready_event
        condition = Async::Condition.new

        event_observer.subscribe opcode: 0, event_name: 'READY', callback: proc { |e| condition.signal e }, once: true

        Async { condition.wait }.wait
      end

      # Helper
      def form_connection_url(raw_url, version, encoding, compress)
        "#{URI(raw_url).scheme}://#{URI(raw_url).host}?v=#{version}&encoding=#{encoding}#{compress ? '&compress=zlib-stream' : ''}"
      end
    end
  end
end
