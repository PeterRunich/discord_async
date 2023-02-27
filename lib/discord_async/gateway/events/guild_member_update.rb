# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class GuildMemberUpdate < Base
        attribute :guild_id, Resources::Snowflake
        attribute :roles, Types::Array.of(Resources::Snowflake)
        attribute :user, Resources::User::User
        attribute? :nick, Types::Coercible::String.optional
        attribute :avatar, Types::Coercible::String.optional
        attribute :joined_at, Types::TimestampISO8601.optional
        attribute? :premium_since, Types::TimestampISO8601.optional
        attribute? :deaf, Types::Bool
        attribute? :mute, Types::Bool
        attribute? :pending, Types::Bool
        attribute? :communication_disabled_until, Types::TimestampISO8601.optional
      end
    end
  end
end
