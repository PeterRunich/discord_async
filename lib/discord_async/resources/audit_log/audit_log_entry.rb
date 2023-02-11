# frozen_string_literal: true

require_relative '../../types'
require_relative '../snowflake'
require_relative 'optional_audit_entry'
require_relative 'audit_log_events'
require_relative 'audit_log_change'

module DiscordAsync
  module Resources
    class AuditLog < Dry::Struct
      class AuditLogEntry < Dry::Struct
        transform_keys(&:to_sym)

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
