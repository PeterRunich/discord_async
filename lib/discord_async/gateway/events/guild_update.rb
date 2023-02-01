require_relative 'base'
require_relative '../../resources/guild/guild'

module DiscordAsync
  class Gateway
    module Events
      class GuildUpdate < Base
        attribute :guild, Resources::Guild

        def initialize(attributes)
          super(guild: attributes)
        end
      end
    end
  end
end
