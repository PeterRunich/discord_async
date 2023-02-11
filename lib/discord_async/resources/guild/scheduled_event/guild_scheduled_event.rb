# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Guild < Dry::Struct
      module ScheduledEvent
        class GuildScheduledEvent < Dry::Struct
          GuildScheduledEventEntityTypes = Types::Integer.enum(1 => :stage_instance, 2 => :voice, 3 => :external)
          GuildScheduledEventStatus = Types::Integer.enum(1 => :scheduled, 2 => :active, 3 => :completed,
                                                          4 => :canceled)
          GuildScheduledEventPrivacyLevel = Types::Integer.enum(2 => :guild_only)

          transform_keys(&:to_sym)

          attribute :id, Types::Snowflake
          attribute :guild_id, Types::Snowflake
          attribute? :channel_id, Types::Snowflake.optional
          attribute? :creator_id, Types::Snowflake.optional
          attribute :name, Types::Coercible::String
          attribute? :description, Types::Coercible::String.optional
          attribute :scheduled_start_time, Types::TimestampISO8601
          attribute :scheduled_end_time, Types::TimestampISO8601.optional
          attribute :privacy_level, GuildScheduledEventPrivacyLevel
          attribute :status, GuildScheduledEventStatus
          attribute :entity_type, GuildScheduledEventEntityTypes
          attribute :entity_id, Types::Snowflake.optional
          attribute :entity_metadata, GuildScheduledEventEntityMetadata
          attribute? :creator, User
          attribute? :user_count, Types::Coercible::Integer
          attribute? :image, Types::Coercible::String.optional
        end
      end
    end
  end
end
