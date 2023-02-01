require 'dry-struct'
require_relative 'base'
require_relative '../../types'
require_relative '../../resources/guild/unavailable_guild'
require_relative '../../resources/guild/guild'
require_relative '../../resources/guild/guild_member'
require_relative '../../resources/channel/channel'
require_relative '../../resources/voice/voice_state'
require_relative '../../resources/stage_instance'
require_relative 'presence_update'
require_relative '../../resources/guild/scheduled_event/guild_scheduled_event'

module DiscordAsync
  class Gateway
    module Events
      class GuildCreate < Base
        class AvailableGuild < Dry::Struct
          attribute :guild, Resources::Guild

          attribute :joined_at, Types::TimestampISO8601
          attribute :large, Types::Bool
          attribute? :unavailable, Types::Bool
          attribute :member_count, Types::Coercible::Integer
          attribute :voice_states, Types::Array.of(Resources::Voice::VoiceState)
          attribute :members, Types::Array.of(Resources::Guild::GuildMember)
          attribute :channels, Types::Array.of(Resources::Channel)
          attribute :threads, Types::Array.of(Resources::Channel)
          attribute :presences, Types::Array.of(PresenceUpdate)
          attribute :stage_instances, Types::Array.of(Resources::StageInstance)
          attribute :guild_scheduled_events, Resources::Guild::ScheduledEvent::GuildScheduledEvent
        end

        attribute :payload, Resources::Guild::UnavailableGuild | AvailableGuild

        def initialize(attributes)
          attributes.transform_keys!(&:to_sym)

          if attributes.fetch(:unavailable, false)
            arguments = {
              guild: attributes,
              joined_at: attributes[:joined_at],
              large: attributes[:large],
              unavailable: attributes[:unavailable],
              member_count: attributes[:member_count],
              voice_states: attributes[:voice_states],
              members: attributes[:members],
              channels: attributes[:channels],
              threads: attributes[:threads],
              presences: attributes[:presences],
              stage_instances: attributes[:stage_instances],
              guild_scheduled_events: attributes[:guild_scheduled_events]
            }

            super(payload: AvailableGuild.new(arguments))
          else
            super(payload: Resources::Guild::UnavailableGuild.new(attributes))
          end
        end
      end
    end
  end
end