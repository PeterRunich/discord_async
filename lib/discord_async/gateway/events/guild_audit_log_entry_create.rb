# frozen_string_literal: true

module DiscordAsync
  class Gateway
    module Events
      class GuildAuditLogEntryCreate < Base
        attribute :audit_log_entry_object, Resources::AuditLog::AuditLogEntry

        def initialize(attributes)
          super(audit_log_entry_object: attributes)
        end
      end
    end
  end
end
