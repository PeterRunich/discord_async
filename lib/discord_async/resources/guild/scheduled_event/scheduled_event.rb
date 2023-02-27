# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Guild
      module ScheduledEvent
        class ScheduledEvent < StructBase
          EntityTypes = Types::Coercible::Integer.enum(1 => :stage_instance, 2 => :voice, 3 => :external)
          Status = Types::Coercible::Integer.enum(1 => :scheduled, 2 => :active, 3 => :completed, 4 => :canceled)
          PrivacyLevel = Types::Coercible::Integer.enum(2 => :guild_only)

          attribute :id, Snowflake
          attribute :guild_id, Snowflake
          attribute? :channel_id, Snowflake.optional
          attribute? :creator_id, Snowflake.optional
          attribute :name, Types::Coercible::String
          attribute? :description, Types::Coercible::String.optional
          attribute :scheduled_start_time, Types::TimestampISO8601
          attribute :scheduled_end_time, Types::TimestampISO8601.optional
          attribute :privacy_level, PrivacyLevel
          attribute :status, Status
          attribute :entity_type, EntityTypes
          attribute :entity_id, Snowflake.optional
          attribute :entity_metadata, EntityMetadata.optional
          attribute? :creator, Resources::User::User
          attribute? :user_count, Types::Coercible::Integer
          attribute? :image, Types::Coercible::String.optional
        end
      end
    end
  end
end
