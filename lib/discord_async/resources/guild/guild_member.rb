# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Guild < Dry::Struct
      class GuildMember < Dry::Struct
        transform_keys(&:to_sym)

        attribute? :user, Resources::Guild
        attribute? :nick, Types::Coercible::String.optional
        attribute? :avatar, Types::Coercible::String.optional
        attribute :roles, Types::Array.of(Types::Snowflake)
        attribute :joined_at, Types::TimestampISO8601
        attribute? :premium_since, Types::TimestampISO8601.optional
        attribute :deaf, Types::Bool
        attribute :mute, Types::Bool
        attribute? :pending, Types::Bool
        attribute? :permissions, Types::Coercible::String
        attribute? :communication_disabled_until, Types::TimestampISO8601.optional
      end

      class PartialGuildMember < Dry::Struct
        transform_keys(&:to_sym)

        attribute? :user, Resources::Guild
        attribute? :nick, Types::Coercible::String.optional
        attribute? :avatar, Types::Coercible::String.optional
        attribute? :roles, Types::Array.of(Types::Snowflake)
        attribute? :joined_at, Types::TimestampISO8601
        attribute? :premium_since, Types::TimestampISO8601.optional
        attribute? :deaf, Types::Bool
        attribute? :mute, Types::Bool
        attribute? :pending, Types::Bool
        attribute? :permissions, Types::Coercible::String
        attribute? :communication_disabled_until, Types::TimestampISO8601.optional
      end
    end
  end
end
