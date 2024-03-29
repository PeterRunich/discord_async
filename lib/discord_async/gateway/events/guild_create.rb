# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class GuildCreate < Base
        class AvailableGuild < StructBase
          attribute :guild, Resources::Guild::Guild

          attribute :joined_at, Types::TimestampISO8601
          attribute :large, Types::Bool
          attribute? :unavailable, Types::Bool
          attribute :member_count, Types::Coercible::Integer
          attribute :voice_states, Types::Array.of(Resources::Voice::State)
          attribute :members, Types::Array.of(Resources::Guild::Member)
          attribute :channels, Types::Array.of(Resources::Channel::Channel)
          attribute :threads, Types::Array.of(Resources::Channel::Channel)
          attribute :presences, Types::Array.of(PresenceUpdate)
          attribute :stage_instances, Types::Array.of(Resources::StageInstance)
          attribute :guild_scheduled_events, Resources::Guild::ScheduledEvent::ScheduledEvent
        end

        attribute :payload, Resources::Guild::UnavailableGuild | AvailableGuild

        def self.new(attributes)
          attributes = attributes.transform_keys(&:to_sym)

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

            attributes[:payload] = AvailableGuild.new(arguments)
          else
            attributes[:payload] = Resources::Guild::UnavailableGuild.new(attributes)
          end

          super(attributes)
        end
      end
    end
  end
end
