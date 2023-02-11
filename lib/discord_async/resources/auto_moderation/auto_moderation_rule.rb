# frozen_string_literal: true

require_relative '../../types'
require_relative '../snowflake'
require_relative 'rule_trigger_metadata'
require_relative 'auto_moderation_action'

module DiscordAsync
  module Resources
    module AutoModeration
      class AutoModerationRule < Dry::Struct
        RuleEventTypes   = Types::Integer.enum(1 => :message_send)
        RuleTriggerTypes = Types::Integer.enum(1 => :keyword, 3 => :spam, 4 => :keyword_preset, 5 => :mention_spam)

        transform_keys(&:to_sym)

        attribute :id, Types::Snowflake
        attribute :guild_id, Types::Snowflake
        attribute :name, Types::Coercible::String
        attribute :creator_id, Types::Snowflake
        attribute :event_type, RuleEventTypes
        attribute :trigger_metadata, RuleTriggerMetadata
        attribute :actions, Types::Array.of(AutoModerationAction)
        attribute :enabled, Types::Bool
        attribute :exempt_roles, Types::Array.of(Types::Snowflake)
        attribute :exempt_channels, Types::Array.of(Types::Snowflake)
      end
    end
  end
end
