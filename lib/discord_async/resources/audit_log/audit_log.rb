# frozen_string_literal: true

module DiscordAsync
  module Resources
    module AuditLog
      class AuditLog < StructBase
        attribute :application_commands, Types::Array.of(Application::Command::Command)
        attribute :audit_log_entries, Types::Array.of(Entry)
        attribute :auto_moderation_rules, Types::Array.of(AutoModeration::Rule)
        attribute :guild_scheduled_events, Types::Array.of(Guild::ScheduledEvent::ScheduledEvent)
        attribute :integrations, Types::Array.of(Guild::Integration::PartialIntegration)
        attribute :threads, Types::Array.of(Channel::Channel)
        attribute :users, Types::Array.of(User::User)
        attribute :webhooks, Types::Array.of(Webhook::Webhook)
      end
    end
  end
end
