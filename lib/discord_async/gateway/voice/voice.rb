# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Voice
      class Voice
        def initialize
          @event_observer = VoiceObserver.new
        end

        def start(gateway, guild_id, channel_id, version)
          started = Async::Condition.new

          state_update  = Async::Condition.new
          server_update = Async::Condition.new

          gateway.event_observer.subscribe opcode: 0, event_name: 'VOICE_STATE_UPDATE', once: true do |e|
            state_update.signal e
          end
          gateway.event_observer.subscribe opcode: 0, event_name: 'VOICE_SERVER_UPDATE', once: true do |e|
            server_update.signal e
          end

          gateway.send_voice_state_update guild_id, channel_id

          state_e = state_update.wait
          server_e = server_update.wait

          establish_connection "wss://#{server_e['d']['endpoint']}?v=#{version}"

          Async { (e = catch_hello_event.wait) && start_heart_beat_loop(e['d']['heartbeat_interval'] / 1000.0) }

          send_identify guild_id, state_e['d']['user_id'], state_e['d']['session_id'], server_e['d']['token']

          Async do
            ready_e = catch_ready_event.wait
            establish_udp_connection ready_e['d']['ip'], ready_e['d']['port'], ready_e['d']['ssrc']
            ip, port = @voice_udp.ip_discovery

            Async do
              @voice_udp.secret_key = catch_session_description.wait['d']['secret_key']
              p 'voice started'
              started.signal @voice_udp
            end

            send_select_protocol ip, port, 'xsalsa20_poly1305'
          end

          start_receive_messages
          started.wait
        end

        def speak
          packet = {
            op: 5,
            d: {
              speaking: 5,
              delay: 0,
              ssrc: @voice_udp.ssrc
            }
          }.to_json

          @connection.write packet
          @connection.flush
        end

        def play(io)
          speak

          Async do
            (io.size / (960 * 4)).times do
              @voice_udp.send io.readpartial(960 * 4)
              sleep 0.019
            end
          end.wait

          io.close

          File.open('en_op', 'w') do |f|
            f.write @voice_udp.tmp.join
          end
        end

        def play_opus(io)
          speak

          Async do
            io.each do |part|
              @voice_udp.send_opus part
              sleep 0.02
            end
          end.wait
        end

        private

        def establish_udp_connection(ip, port, ssrc)
          @voice_udp = VoiceUDP.new ip, port, ssrc
        end

        def establish_connection(url, ws_client: Async::WebSocket::Client)
          endpoint = Async::HTTP::Endpoint.parse url, alpn_protocols: Async::HTTP::Protocol::HTTP11.names
          @connection = ws_client.connect endpoint
        end

        def send_identify(server_id, user_id, session_id, token)
          data = {
            op: 0,
            d: {
              server_id:,
              user_id:,
              session_id:,
              token:
            }
          }.to_json

          @connection.write data
          @connection.flush
        end

        def catch_hello_event
          condition = Async::Condition.new

          @event_observer.subscribe opcode: 8, callback: proc { |e| condition.signal e }, once: true

          Async { condition.wait }
        end

        def start_heart_beat_loop(heartbeat_interval)
          Async do
            until @connection.closed?
              sleep heartbeat_interval
              send_heart_beat
              p "sended #{Time.now}  nex in #{Time.now + heartbeat_interval}"
            end
          end
        end

        def send_heart_beat
          return if @connection.closed?

          @connection.write({ op: 3, d: 1 }.to_json)
          @connection.flush
        end

        def catch_ready_event
          condition = Async::Condition.new

          @event_observer.subscribe opcode: 2, callback: proc { |e| condition.signal e }, once: true

          Async { condition.wait }
        end

        def catch_session_description
          condition = Async::Condition.new

          @event_observer.subscribe opcode: 4, callback: proc { |e| condition.signal e }, once: true

          Async { condition.wait }
        end

        def start_receive_messages
          Async do
            while (msg = @connection.read)
              pp JSON.parse msg
              @event_observer.notify JSON.parse msg
            end
          end
        end

        def send_select_protocol(address, port, mode)
          data = {
            "op": 1,
            "d": {
              "protocol": 'udp',
              "data": {
                address:,
                port:,
                mode:
              }
            }
          }.to_json

          @connection.write data
          @connection.flush
        end
      end
    end
  end
end
