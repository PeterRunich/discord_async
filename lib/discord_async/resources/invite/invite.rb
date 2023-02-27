# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Invite
      class Invite < StructBase
        attribute :code, Types::Coercible::String
        attribute? :guild, Guild::PartialGuild
        attribute :channel, Channel::Channel.optional # partial channel
        attribute? :inviter, User::User
        attribute? :target_type, TargetTypes
        attribute? :target_user, User::User
        attribute? :target_application, Application::PartialApplication
        attribute? :approximate_presence_count, Types::Coercible::Integer
        attribute? :approximate_member_count, Types::Coercible::Integer
        attribute? :expires_at, Types::TimestampISO8601.optional
        attribute? :stage_instance, StageInstance
        attribute? :guild_scheduled_event, Guild::ScheduledEvent
      end
    end
  end
end
