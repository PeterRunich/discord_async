# frozen_string_literal: true

module DiscordAsync
  module Resources
    module AuditLog
      class OptionalAuditEntry < StructBase
        attribute :application_id, Snowflake
        attribute :auto_moderation_rule_name, Types::Coercible::String
        attribute :auto_moderation_rule_trigger_type, Types::Coercible::String
        attribute :channel_id, Snowflake
        attribute :count, Types::Coercible::String
        attribute :delete_member_days, Types::Coercible::String
        attribute :id, Snowflake
        attribute :members_removed, Types::Coercible::String
        attribute :message_id, Snowflake
        attribute :role_name, Types::Coercible::String
        attribute :type, Types::Coercible::String
      end
    end
  end
end
