# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class ThreadUpdate < Base
        attribute :channel, Resources::Channel::Channel

        def self.new(attributes)
          super(channel: attributes)
        end
      end
    end
  end
end
