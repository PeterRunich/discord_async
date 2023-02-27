# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class AutoModerationActionExecution < Base
        attribute :guild_id, Resources::Snowflake
        attribute :action, Resources::AutoModeration::Rule
        attribute :rule_id, Resources::Snowflake
        attribute :rule_trigger_type, Resources::AutoModeration::RuleTriggerTypes
        attribute :user_id, Resources::Snowflake
        attribute :channel_id, Resources::Snowflake
        attribute :message_id, Resources::Snowflake
        attribute :alert_system_message_id, Resources::Snowflake
        attribute :content, Types::Coercible::String
        attribute :matched_keyword, Types::Coercible::String.optional
        attribute :matched_content, Types::Coercible::String.optional
      end
    end
  end
end
