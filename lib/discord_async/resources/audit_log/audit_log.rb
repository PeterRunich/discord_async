require 'dry-struct'
require_relative '../../types'
require_relative '../application/application_command'
require_relative 'audit_log_entry'
require_relative '../auto_moderation/auto_moderation_rule'
require_relative '../guild/scheduled_event/guild_scheduled_event'
require_relative '../channel/channel'
require_relative '../user/user'
require_relative '../guild/integration/integration'
require_relative '../webhook'

module DiscordAsync
  module Resources
    class AuditLog < Dry::Struct
      transform_keys(&:to_sym)

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