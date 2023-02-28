# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Channel
      class ThreadMember < StructBase
        attribute? :id, Snowflake
        attribute? :user_id, Snowflake
        attribute :join_timestamp, Types::TimestampISO8601
        attribute :flags, Types::Coercible::Integer
        attribute? :member, Guild::Member
      end
    end
  end
end
