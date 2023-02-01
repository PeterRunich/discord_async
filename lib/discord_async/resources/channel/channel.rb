require 'dry-struct'
require_relative '../../types'
require_relative '../../resources/snowflake'
require_relative 'overwrite'
require_relative '../user/user'
require_relative 'thread_metadata'
require_relative 'thread_member'
require_relative 'default_reaction'
require_relative 'forum_tag'

module DiscordAsync
  module Resources
    class Channel < Dry::Struct
      ChannelTypes = Types::Integer.enum(0 => :guild_text, 1 => :dm, 2 => :guild_voice, 3 => :group_dm, 4 => :guild_category, 5 => :guild_announcement, 10 => :announcement_thread, 11 => :public_thread, 12 => :private_thread, 13 => :guild_stage_voice, 14 => :guild_directory, 15 => :guild_forum)

      transform_keys(&:to_sym)

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