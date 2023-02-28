# frozen_string_literal: true

require 'json'

module DiscordAsync
  module Gateway
    class SendPayload < StructBase
      attribute :op, Opcodes
      attribute? :d, Types.Nominal(Events::Send::Base).optional

      def self.new(attributes)
        attributes = attributes.transform_keys(&:to_sym)

        attributes[:d] =
          case attributes.fetch(:op)
          when Opcodes[:identify] then Events::Send::Identify
          when Opcodes[:resume] then Events::Send::Resume
          when Opcodes[:heartbeat] then Events::Send::Heartbeat
          when Opcodes[:request_guild_members] then Events::Send::RequestGuildMembers
          when Opcodes[:voice_state_update] then Events::Send::UpdateVoiceState
          when Opcodes[:presence_update] then Events::Send::UpdatePresence
          else raise
          end.new(attributes[:d])

        super
      end

      def to_json(*)
        (d.nil? ? to_h : to_h.merge!(d: d.to_event_data)).to_json(*)
      end
    end
  end
end
