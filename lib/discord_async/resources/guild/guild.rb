require 'dry-struct'
require_relative '../../types'
require_relative '../snowflake'
require_relative '../sticker/sticker'
require_relative 'welcome_screen'
require_relative '../role'
require_relative '../emoji'

module DiscordAsync
  module Resources
    class Guild < Dry::Struct
      transform_keys(&:to_sym)

      attribute :id, Types::Snowflake
      attribute :name, Types::Coercible::String
      attribute :icon, Types::Coercible::String.optional
      attribute :icon_hash, Types::Coercible::String.optional
      attribute :splash, Types::Coercible::String.optional
      attribute :discovery_splash, Types::Coercible::String.optional
      attribute? :owner, Types::Bool
      attribute :owner_id, Types::Snowflake
      attribute? :permissions, Types::Coercible::String
      attribute :afk_channel_id, Types::Snowflake.optional
      attribute :afk_timeout, Types::Coercible::Integer
      attribute? :widget_enabled, Types::Bool
      attribute? :widget_channel_id, Types::Snowflake.optional
      attribute :verification_level, Types::Coercible::Integer
      attribute :default_message_notifications, Types::Coercible::Integer
      attribute :explicit_content_filter, Types::Coercible::Integer
      attribute :roles, Types::Array.of(Role)
      attribute :emojis, Types::Array.of(Emoji)
      attribute :features, Types::Array.of(Types::Coercible::String)
      attribute :mfa_level, Types::Coercible::Integer
      attribute :application_id, Types::Snowflake.optional
      attribute :system_channel_id, Types::Snowflake.optional
      attribute :system_channel_flags, Types::Coercible::Integer
      attribute :rules_channel_id, Types::Snowflake.optional
      attribute? :max_presences, Types::Coercible::Integer.optional
      attribute? :max_members, Types::Coercible::Integer
      attribute :vanity_url_code, Types::Coercible::String.optional
      attribute :description, Types::Coercible::String.optional
      attribute :banner, Types::Coercible::String.optional
      attribute :premium_tier, Types::Coercible::Integer
      attribute? :premium_subscription_count, Types::Coercible::Integer
      attribute :preferred_locale, Types::Coercible::String
      attribute :public_updates_channel_id, Types::Snowflake.optional
      attribute? :max_video_channel_users, Types::Coercible::Integer
      attribute? :approximate_member_count, Types::Coercible::Integer
      attribute? :approximate_presence_count, Types::Coercible::Integer
      attribute? :welcome_screen, WelcomeScreen
      attribute :nsfw_level, Types::Coercible::Integer
      attribute? :stickers, Resources::Sticker
      attribute :premium_progress_bar_enabled, Types::Bool
    end

    class PartialGuild < Dry::Struct
      transform_keys(&:to_sym)

      attribute :id, Types::Snowflake
      attribute? :name, Types::Coercible::String
      attribute? :icon, Types::Coercible::String.optional
      attribute? :icon_hash, Types::Coercible::String.optional
      attribute? :splash, Types::Coercible::String.optional
      attribute? :discovery_splash, Types::Coercible::String.optional
      attribute? :owner, Types::Bool
      attribute? :owner_id, Types::Snowflake
      attribute? :permissions, Types::Coercible::String
      attribute? :afk_channel_id, Types::Snowflake.optional
      attribute? :afk_timeout, Types::Coercible::Integer
      attribute? :widget_enabled, Types::Bool
      attribute? :widget_channel_id, Types::Snowflake.optional
      attribute? :verification_level, Types::Coercible::Integer
      attribute? :default_message_notifications, Types::Coercible::Integer
      attribute? :explicit_content_filter, Types::Coercible::Integer
      attribute? :roles, Types::Array.of(Role)
      attribute? :emojis, Types::Array.of(Emoji)
      attribute? :features, Types::Array.of(Types::Coercible::String)
      attribute? :mfa_level, Types::Coercible::Integer
      attribute? :application_id, Types::Snowflake.optional
      attribute? :system_channel_id, Types::Snowflake.optional
      attribute? :system_channel_flags, Types::Coercible::Integer
      attribute? :rules_channel_id, Types::Snowflake.optional
      attribute? :max_presences, Types::Coercible::Integer.optional
      attribute? :max_members, Types::Coercible::Integer
      attribute? :vanity_url_code, Types::Coercible::String.optional
      attribute? :description, Types::Coercible::String.optional
      attribute? :banner, Types::Coercible::String.optional
      attribute? :premium_tier, Types::Coercible::Integer
      attribute? :premium_subscription_count, Types::Coercible::Integer
      attribute? :preferred_locale, Types::Coercible::String
      attribute? :public_updates_channel_id, Types::Snowflake.optional
      attribute? :max_video_channel_users, Types::Coercible::Integer
      attribute? :approximate_member_count, Types::Coercible::Integer
      attribute? :approximate_presence_count, Types::Coercible::Integer
      attribute? :welcome_screen, Guild::WelcomeScreen
      attribute? :nsfw_level, Types::Coercible::Integer
      attribute? :stickers, Resources::Sticker
      attribute? :premium_progress_bar_enabled, Types::Bool
    end
  end
end