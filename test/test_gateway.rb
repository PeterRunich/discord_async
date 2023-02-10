require 'minitest/autorun'
require 'discord_async/gateway/gateway'
require 'json'
require 'spy/integration'

describe DiscordAsync::Gateway do
  describe 'first connection to websocket' do
    describe 'form connection url' do
      it 'with extra params' do
        encoding = DiscordAsync::Gateway::EncodingTypes::JSON
        gateway = DiscordAsync::Gateway.new 'fake_token'

        formed_url = gateway.send :form_connection_url, 'wss://gateway.discord.gg/', 4, encoding, true

        assert_equal formed_url, 'wss://gateway.discord.gg?v=4&encoding=json&compress=zlib-stream'
      end

      it 'without compression' do
        encoding = DiscordAsync::Gateway::EncodingTypes::JSON
        gateway = DiscordAsync::Gateway.new 'fake_token'

        formed_url = gateway.send :form_connection_url, 'wss://gateway.discord.gg/', 4, encoding, false

        assert_equal formed_url, 'wss://gateway.discord.gg?v=4&encoding=json'
      end
    end

    it 'establish connection' do
      url = 'wss://gateway.discord.gg?v=4&encoding=json'
      gateway = DiscordAsync::Gateway.new 'fake_token'
      ws_client = Minitest::Mock.new
      ws_client.expect :connect, true, [Async::HTTP::Endpoint]

      gateway.send(:establish_connection, url, ws_client:)

      assert ws_client.verify
    end

    it 'receives messages from connection' do
      url = 'wss://gateway.discord.gg?v=4&encoding=json'
      gateway = DiscordAsync::Gateway.new 'fake_token'
      ws_client = Object.new

      def ws_client.connect(_)
        fake_connection = Object.new
        fake_connection.instance_variable_set :@closed, false

        def fake_connection.close = @closed = true

        def fake_connection.read
          Async::Task.current.yield
          return nil if @closed

          { op: 10, d: { heartbeat_interval: 45000 } }.to_json
        end

        fake_connection
      end

      gateway.send(:establish_connection, url, ws_client:)

      callback = proc do |e|
        assert_equal e['op'], 10
        gateway.stop
      end

      callback_spy = Spy.on(callback, :call).and_call_through

      gateway.event_observer.subscribe(opcode: 10, once: true, callback:)

      gateway.send(:start_receive_messages)

      assert callback_spy.has_been_called?
    end

    it 'receives hello event' do
      assert_reached = proc {}
      assert_reached_spy = Spy.on(assert_reached, :call).and_call_through

      url = 'wss://gateway.discord.gg?v=4&encoding=json'
      gateway = DiscordAsync::Gateway.new 'fake_token'
      ws_client = Object.new

      def ws_client.connect(_)
        fake_connection = Object.new
        fake_connection.instance_variable_set :@closed, false

        def fake_connection.close = @closed = true

        def fake_connection.read
          Async::Task.current.yield
          return nil if @closed

          { op: 10, d: { heartbeat_interval: 45000 } }.to_json
        end

        fake_connection
      end

      Async do
        gateway.send(:establish_connection, url, ws_client:)

        Async do
          e = gateway.send(:catch_hello_event).wait
          assert_equal e['op'], 10
          assert_reached.call
          gateway.stop
        end

        gateway.send(:start_receive_messages)
      end

      assert assert_reached_spy.has_been_called?
    end

    it 'start heart beat loop' do
      assert = self.method(:assert)
      assert_reached = proc {}
      assert_reached_spy = Spy.on(assert_reached, :call).and_call_through
      url = 'wss://gateway.discord.gg?v=4&encoding=json'
      gateway = DiscordAsync::Gateway.new 'fake_token'
      ws_client = Object.new

      ws_client.define_singleton_method :connect do |_|
        fake_connection = Object.new
        fake_connection.instance_variable_set :@closed, false
        fake_connection.instance_variable_set :@send_events, [{ op: 10, d: { heartbeat_interval: 200 } }]
        fake_connection.instance_variable_set :@recv_events, []
        def fake_connection.close = @closed = true
        def fake_connection.closed? = @closed


        fake_connection.define_singleton_method :read do
          Async::Task.current.yield
          return nil if @closed

          next_event = @send_events.shift
          if next_event
            Async do
              sleep 0.4
              assert.call @recv_events.size == 2
              assert_reached.call
              gateway.stop
            end
            next_event.to_json
          end
        end

        def fake_connection.write(data)
          @data = data
        end

        def fake_connection.flush
          return unless @data
          @recv_events << @data
          @data = nil
        end

        fake_connection
      end

      Async do
        gateway.send(:establish_connection, url, ws_client:)

        Async do
          e = gateway.send(:catch_hello_event).wait

          stub(:rand, 1) do
            gateway.send :start_heart_beat_loop, e['d']['heartbeat_interval'] / 1000.0
          end
        end

        gateway.send(:start_receive_messages)
      end

      assert assert_reached_spy.has_been_called?
    end

    it 'sends identify' do
      url = 'wss://gateway.discord.gg?v=4&encoding=json'
      assert_reached = proc {}
      assert_reached_spy = Spy.on(assert_reached, :call).and_call_through
      assert = self.method(:assert)
      refute = self.method(:refute)

      identify_info = {
        token: 'fake_token',
        properties: { os: RUBY_PLATFORM, browser: 'test', device:'test' },
        intents: 1
      }
      gateway = DiscordAsync::Gateway.new 'fake_token'
      ws_client = Object.new
      ws_client.define_singleton_method(:connect) do |_|
        fake_connection = Object.new
        fake_connection.instance_variable_set :@closed, false
        def fake_connection.close = @closed = true
        def fake_connection.closed? = @closed

        def fake_connection.write(data)
          @data = JSON.parse data
        end

        fake_connection.define_singleton_method :flush do
          assert.call @data['op'] == 2
          refute.call @data['d'].empty?
          assert_reached.call
        end

        fake_connection
      end

      gateway.send(:establish_connection, url, ws_client:)

      gateway.send(:send_identify, DiscordAsync::Gateway::Identify[**identify_info])

      assert assert_reached_spy.has_been_called?
    end

    it 'receives ready event' do
      assert_reached = proc {}
      assert_reached_spy = Spy.on(assert_reached, :call).and_call_through

      url = 'wss://gateway.discord.gg?v=4&encoding=json'
      gateway = DiscordAsync::Gateway.new 'fake_token'
      ws_client = Object.new

      def ws_client.connect(_)
        fake_connection = Object.new
        fake_connection.instance_variable_set :@closed, false
        def fake_connection.close = @closed = true

        def fake_connection.read
          Async::Task.current.yield
          return nil if @closed

          { op: 0, t: 'READY' }.to_json
        end

        fake_connection
      end

      Async do
        gateway.send(:establish_connection, url, ws_client:)

        Async do
          e = gateway.send(:catch_ready_event).wait
          assert_equal e['op'], 0
          assert_equal e['t'], 'READY'

          assert_reached.call
          gateway.stop
        end

        gateway.send(:start_receive_messages)
      end

      assert assert_reached_spy.has_been_called?
    end
  end
end
