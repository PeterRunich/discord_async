# frozen_string_literal: true

module DiscordAsync
  class Gateway
    module Events
      class GuildRoleCreate < Base
        attribute :guild_id, Types::Snowflake
        attribute :role, Resources::Role
      end
    end
  end
end
