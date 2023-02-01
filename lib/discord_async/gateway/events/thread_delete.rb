require_relative 'base'

module DiscordAsync
  class Gateway
    module Events
      class ThreadDelete < Base
        attribute :channel, Resources::Channel

        def initialize(attributes)
          super(channel: attributes)
        end
      end
    end
  end
end
