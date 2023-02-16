# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Channel < StructBase
      attribute :id, Types::Snowflake
      attribute :type, ChannelTypes
      attribute? :guild_id, Types::Snowflake
      attribute? :position, Types::Coercible::Integer
      attribute? :permission_overwrites, Types::Array.of(Overwrite)
      attribute? :name, Types::Coercible::String.optional
      attribute? :topic, Types::Coercible::String.optional
      attribute? :nsfw, Types::Bool
      attribute? :last_message_id, Types::Snowflake.optional
      attribute? :bitrate, Types::Coercible::Integer
      attribute? :rate_limit_per_user, Types::Coercible::Integer
      attribute? :recipients, Types::Array.of(User)
      attribute? :icon, Types::Coercible::String.optional
      attribute? :owner_id, Types::Snowflake
      attribute? :application_id, Types::Snowflake
      attribute? :parent_id, Types::Snowflake.optional
      attribute? :last_pin_timestamp, Types::TimestampISO8601.optional
      attribute? :rtc_region, Types::Coercible::String.optional
      attribute? :video_quality_mode, Types::Coercible::Integer
      attribute? :message_count, Types::Coercible::Integer
      attribute? :member_count, Types::Coercible::Integer
      attribute? :thread_metadata, ThreadMetadata
      attribute? :member, ThreadMember
      attribute? :default_auto_archive_duration, Types::Coercible::Integer
      attribute? :permissions, Types::Coercible::String
      attribute? :flags, Types::Coercible::Integer
      attribute? :total_message_sent, Types::Coercible::Integer
      attribute? :available_tags, Types::Array.of(ForumTag)
      attribute? :applied_tags, Types::Array.of(Types::Snowflake)
      attribute? :default_reaction_emoji, DefaultReaction.optional
      attribute? :default_thread_rate_limit_per_user, Types::Coercible::Integer
      attribute? :default_sort_order, Types::Coercible::Integer.optional
      attribute? :default_forum_layout, Types::Coercible::Integer
    end
  end
end
