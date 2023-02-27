# frozen_string_literal: true

module DiscordAsync
  module Gateway
    class Observer
      def initialize = @subscribers = []

      def subscribe(subscriber) = @subscribers << subscriber

      def unsubscribe(subscriber) = @subscribers.delete subscriber

      def notify(event) = @subscribers.each { _1[event] }
    end
  end
end
