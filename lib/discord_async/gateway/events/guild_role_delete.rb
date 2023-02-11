# frozen_string_literal: true

module DiscordAsync
  class Gateway
    module Events
      class GuildRoleDelete < Base
        attribute :guild_id, Types::Snowflake
        attribute :role_id, Types::Snowflake
      end
    end
  end
end
