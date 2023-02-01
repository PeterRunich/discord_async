module DiscordAsync
  class EventObserver
    def initialize
      @subscribers = { 0 => {}, 1 => [], 7 => [], 9 => [], 10 => [], 11 => [] }
    end

    def subscribe(opcode:, callback: nil, event_name: nil, once: false, &blk_callback)
      case opcode
      when 0
        @subscribers.fetch(opcode)[event_name.to_sym] ||= []
        @subscribers.fetch(opcode)[event_name.to_sym] << { callback: (blk_callback || callback), once: }
      else
        @subscribers.fetch(opcode) << { callback: (blk_callback || callback), once: }
      end
    end

    def unsubscribe(opcode:, event_name: nil, callback:)
      case opcode
      when 0
        @subscribers.fetch(opcode)[event_name.to_sym].delete_if { |sub| sub[:callback] == callback }
      else
        @subscribers.fetch(opcode).delete_if { |sub| sub[:callback] == callback }
      end
    end

    def notify(event)
      case event['op']
      when 0
        @subscribers.fetch(event['op'])[event['t'].to_sym]&.each { |sub| Async { sub[:callback].call(event) } }
        @subscribers.fetch(event['op'])[event['t'].to_sym]&.delete_if { |sub| sub[:once] }
      else
        @subscribers.fetch(event['op']).each { |sub| Async { sub[:callback].call(event) } }
        @subscribers.fetch(event['op']).delete_if { |sub| sub[:once] }
      end
    end
  end
end
