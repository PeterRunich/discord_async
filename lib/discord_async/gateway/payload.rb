require 'dry-struct'
require_relative '../types'
require_relative 'opcodes'
require_relative 'events/events'
require_relative 'events/base'

module Types
  Event = Types.Constructor(lambda do |event_obj|
    raise unless event_obj.kind_of? Event::Base

    event_obj
  end, &:call)
end

module DiscordAsync
  class Gateway
    class Payload < Dry::Struct
      transform_keys(&:to_sym)

      attribute :op, Types::Coercible::Integer
      attribute :d, Types::Event
      attribute :s, Types::Coercible::Integer.optional
      attribute :t, Types::Coercible::String.optional

      def initialize(attributes)
        attributes.transform_keys!(&:to_sym)

        # rubocop:disable Layout/CaseIndentation, Layout/EndAlignment
        attributes[:d] = case attributes.fetch(:op)
        when Opcodes[:dispatch]
          Events.const_get(attributes[:t].to_s.split('_').map(&:capitalize).join).new(attributes[:d])
        when Opcodes[:heartbeat] then Events::Heartbeat.new(attributes[:d])
        when Opcodes[:identify] then Events::Identify.new(attributes[:d])
        when Opcodes[:presence_update] then Events::PresenceUpdate.new(attributes[:d])
        when Opcodes[:voice_state_update] then Events::VoiceStateUpdate.new(attributes[:d])
        when Opcodes[:resume] then Events::VoiceStateUpdate.new(attributes[:d])
        when Opcodes[:reconnect] then Events::Reconnect.new(attributes[:d])
        when Opcodes[:request_guild_members] then Events::RequestGuildMembers.new(attributes[:d])
        when Opcodes[:invalid_session] then Events::InvalidSession.new(attributes[:d])
        when Opcodes[:hello] then Events::Hello.new(attributes[:d])
        when Opcodes[:heartbeat_ack] then Events::HeartbeatAck.new(attributes[:d])
        else
          raise
        end
        # rubocop:enable Layout/CaseIndentation, Layout/EndAlignment

        super(attributes)
      end
    end
  end
end
