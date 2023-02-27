# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class GuildMemberRemove < Base
        attribute :guild_id, Resources::Snowflake
        attribute :user, Resources::User::User
      end
    end
  end
end
