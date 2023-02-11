# frozen_string_literal: true

module DiscordAsync
  module Resources
    class AuditLog < StructBase
      class AuditLogEntry < StructBase
        attribute :target_id, Types::Coercible::String
        attribute? :changes, Types::Array.of(AuditLogChange)
        attribute :user_id, Types::Snowflake.optional
        attribute :id, Types::Snowflake
        attribute :action_type, AuditLogEvents
        attribute? :options, OptionalAuditEntry
        attribute? :reason, Types::Coercible::String
      end
    end
  end
end
