require_relative 'base'
require_relative '../../resources/guild/unavailable_guild'

module DiscordAsync
  class Gateway
    module Events
      class GuildDelete < Base
        attribute :unavailable_guild, Resources::Guild::UnavailableGuild

        def initialize(attributes)
          super(unavailable_guild: attributes)
        end
      end
    end
  end
end
