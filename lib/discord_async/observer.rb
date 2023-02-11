# frozen_string_literal: true

module DiscordAsync
  class Observer
    def initialize = @subscribers = []

    def subscribe(subscriber) = @subscribers << subscriber

    def unsubscribe(subscriber) = @subscribers.delete subscriber

    def notify(event) = @subscribers.each { |sub| sub.call event }
  end
end
