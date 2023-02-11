# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Channel < StructBase
      class ThreadMember < StructBase
        attribute? :id, Types::Snowflake
        attribute? :user_id, Types::Snowflake
        attribute :join_timestamp, Types::TimestampISO8601
        attribute :flags, Types::Coercible::Integer
        attribute? :member, Resources::Guild::GuildMember
      end
    end
  end
end
