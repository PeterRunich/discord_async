# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class GuildDelete < Base
        attribute :unavailable_guild, Resources::Guild::UnavailableGuild

        def self.new(attributes)
          super(unavailable_guild: attributes)
        end
      end
    end
  end
end
