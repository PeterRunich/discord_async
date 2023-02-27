# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class GuildRoleDelete < Base
        attribute :guild_id, Resources::Snowflake
        attribute :role_id, Resources::Snowflake
      end
    end
  end
end
