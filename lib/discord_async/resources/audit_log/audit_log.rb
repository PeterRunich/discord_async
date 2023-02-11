# frozen_string_literal: true

module DiscordAsync
  module Resources
    class AuditLog < StructBase
      attribute :application_commands, Types::Array.of(ApplicationCommand)
      attribute :audit_log_entries, Types::Array.of(AuditLogEntry)
      attribute :auto_moderation_rules, Types::Array.of(AutoModerationRule)
      attribute :guild_scheduled_events, Types::Array.of(Guild::ScheduledEvent::GuildScheduledEvent)
      attribute :integrations, Types::Array.of(Guild::PartialIntegration)
      attribute :threads, Types::Array.of(Channel)
      attribute :users, Types::Array.of(User)
      attribute :webhooks, Types::Array.of(Webhook)
    end
  end
end
