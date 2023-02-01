require 'dry-struct'
require_relative 'base'
require_relative '../../resources/auto_moderation/auto_moderation_rule'
module DiscordAsync
  class Gateway
    module Events
      class AutoModerationActionExecution < Base
        attribute :guild_id, Types::Snowflake
        attribute :action, Resources::AutoModeration::AutoModerationRule
        attribute :rule_id, Types::Snowflake
        attribute :rule_trigger_type, Resources::AutoModeration::AutoModerationRule::RuleTriggerTypes
        attribute :user_id, Types::Snowflake
        attribute :channel_id, Types::Snowflake
        attribute :message_id, Types::Snowflake
        attribute :alert_system_message_id, Types::Snowflake
        attribute :content, Types::Coercible::String
        attribute :matched_keyword, Types::Coercible::String.optional
        attribute :matched_content, Types::Coercible::String.optional
      end
    end
  end
end
