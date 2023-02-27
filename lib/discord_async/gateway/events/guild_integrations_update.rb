# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class GuildIntegrationsUpdate < Base
        attribute :guild_id, Resources::Snowflake
      end
    end
  end
end
