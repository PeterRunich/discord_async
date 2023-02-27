# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Guild
      class Member < StructBase
        attribute? :user, User::User
        attribute? :nick, Types::Coercible::String.optional
        attribute? :avatar, Types::Coercible::String.optional
        attribute :roles, Types::Array.of(Snowflake)
        attribute :joined_at, Types::TimestampISO8601
        attribute? :premium_since, Types::TimestampISO8601.optional
        attribute :deaf, Types::Bool
        attribute :mute, Types::Bool
        attribute? :pending, Types::Bool
        attribute? :permissions, Types::Coercible::String
        attribute? :communication_disabled_until, Types::TimestampISO8601.optional
      end
    end
  end
end
