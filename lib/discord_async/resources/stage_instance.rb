# frozen_string_literal: true

module DiscordAsync
  module Resources
    class StageInstance < StructBase
      PrivacyLevel = Types::Integer.enum(1 => :public, 2 => :guild_only)

      attribute :id, Types::Snowflake
      attribute :guild_id, Types::Snowflake
      attribute :channel_id, Types::Snowflake
      attribute :topic, Types::Coercible::String
      attribute :privacy_level, PrivacyLevel
      attribute :discoverable_disabled, Types::Bool
      attribute :guild_scheduled_event_id, Types::Snowflake.optional
    end
  end
end
