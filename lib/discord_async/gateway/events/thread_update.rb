# frozen_string_literal: true

module DiscordAsync
  class Gateway
    module Events
      class ThreadUpdate < Base
        attribute :channel, Resources::Channel

        def initialize(attributes)
          super(channel: attributes)
        end
      end
    end
  end
end
