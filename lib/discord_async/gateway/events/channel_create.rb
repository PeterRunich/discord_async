require_relative 'base'
require_relative '../../resources/channel/channel'

module DiscordAsync
  class Gateway
    module Events
      class ChannelCreate < Base
        attribute :channel, Resources::Channel

        def initialize(attributes)
          super(channel: attributes)
        end
      end
    end
  end
end
