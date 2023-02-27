# frozen_string_literal: true

module DiscordAsync
  module Resources
    module AutoModeration
      class Rule < StructBase
        RuleEventTypes = Types::Coercible::Integer.enum(1 => :message_send)

        attribute :id, Snowflake
        attribute :guild_id, Snowflake
        attribute :name, Types::Coercible::String
        attribute :creator_id, Snowflake
        attribute :event_type, RuleEventTypes
        attribute :trigger_metadata, RuleTriggerMetadata
        attribute :actions, Types::Array.of(Action)
        attribute :enabled, Types::Bool
        attribute :exempt_roles, Types::Array.of(Snowflake)
        attribute :exempt_channels, Types::Array.of(Snowflake)
      end
    end
  end
end
