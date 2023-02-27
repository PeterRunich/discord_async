# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class ThreadDelete < Base
        attribute :channel, Resources::Channel::Channel

        def initialize(attributes)
          super(channel: attributes)
        end
      end
    end
  end
end
