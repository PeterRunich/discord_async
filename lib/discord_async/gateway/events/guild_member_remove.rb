# frozen_string_literal: true

module DiscordAsync
  class Gateway
    module Events
      class GuildMemberRemove < Base
        attribute :guild_id, Types::Snowflake
        attribute :user, Resources::User
      end
    end
  end
end
