# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class GuildRoleUpdate < Base
        attribute :guild_id, Resources::Snowflake
        attribute :role, Resources::Role
      end
    end
  end
end
