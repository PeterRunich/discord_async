require 'minitest/autorun'
require 'discord_async/event_observer'

describe DiscordAsync::EventObserver do
  describe 'manipulation with all opcodes exclude 0' do
    it 'subscribes' do
      observer = DiscordAsync::EventObserver.new
      callback = proc {}

      observer.subscribe(opcode: 1, callback:)

      assert observer.instance_variable_get(:@subscribers)[1].first[:callback], callback
    end

    it 'unsubscribes' do
      observer = DiscordAsync::EventObserver.new
      callback = proc {}

      observer.subscribe(opcode: 1, callback:)
      refute observer.instance_variable_get(:@subscribers)[1].empty?

      observer.unsubscribe(opcode: 1, callback:)
      assert observer.instance_variable_get(:@subscribers)[1].empty?
    end

    it 'notify' do
      observer = DiscordAsync::EventObserver.new
      mock = Minitest::Mock.new
      mock.expect :call, true, [Hash]

      observer.subscribe(opcode: 1, callback: mock)

      observer.notify({ 'op' => 1 })

      assert mock.verify
    end

    it 'subscribes once' do
      observer = DiscordAsync::EventObserver.new
      mock = Minitest::Mock.new
      mock.expect :call, true, [Hash]

      observer.subscribe(opcode: 1, callback: mock, once: true)
      observer.notify({ 'op' => 1 })

      assert mock.verify
      assert observer.instance_variable_get(:@subscribers)[1].empty?
    end
  end

  describe 'manipulation only with opcode 0' do
    it 'subscribes' do
      observer = DiscordAsync::EventObserver.new
      callback = proc {}

      observer.subscribe(opcode: 0, event_name: 'READY', callback:)

      assert observer.instance_variable_get(:@subscribers)[0][:READY].first[:callback], callback
    end

    it 'unsubscribes' do
      observer = DiscordAsync::EventObserver.new
      callback = proc {}

      observer.subscribe(opcode: 0, event_name: 'READY', callback:)
      refute observer.instance_variable_get(:@subscribers)[0][:READY].empty?

      observer.unsubscribe(opcode: 0, event_name: 'READY', callback:)
      assert observer.instance_variable_get(:@subscribers)[0][:READY].empty?
    end

    it 'notify' do
      observer = DiscordAsync::EventObserver.new
      mock = Minitest::Mock.new
      mock.expect :call, true, [Hash]

      observer.subscribe(opcode: 0, event_name: 'READY', callback: mock)

      observer.notify({ 'op' => 0, 't' => 'READY' })

      assert mock.verify
    end

    it 'subscribes once' do
      observer = DiscordAsync::EventObserver.new
      mock = Minitest::Mock.new
      mock.expect :call, true, [Hash]

      observer.subscribe(opcode: 0, event_name: 'READY', callback: mock, once: true)
      observer.notify({ 'op' => 0, 't' => 'READY' })

      assert mock.verify
      assert observer.instance_variable_get(:@subscribers)[0][:READY].empty?
    end
  end
end
