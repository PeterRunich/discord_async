# frozen_string_literal: true

module DiscordAsync
  class Gateway
    module Events
      class GuildIntegrationsUpdate < Base
        attribute :guild_id, Types::Snowflake
      end
    end
  end
end
