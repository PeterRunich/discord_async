# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Guild
      class Template < StructBase
        attribute :code, Types::Coercible::String
        attribute :name, Types::Coercible::String
        attribute :description, Types::Coercible::String.optional
        attribute :usage_count, Types::Coercible::Integer
        attribute :creator_id, Snowflake
        attribute :creator, User::User
        attribute :created_at, Types::TimestampISO8601
        attribute :updated_at, Types::TimestampISO8601
        attribute :source_guild_id, Snowflake
        attribute :serialized_source_guild, PartialGuild
        attribute :is_dirty, Types::Bool.optional
      end
    end
  end
end
