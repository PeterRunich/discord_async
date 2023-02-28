# frozen_string_literal: true

module DiscordAsync
  module Gateway
    class Payload < StructBase
      attribute :op, Opcodes
      attribute? :d, Types.Nominal(Events::Base).optional
      attribute? :s, Types::Coercible::Integer.optional
      attribute? :t, Types::Coercible::Symbol.optional

      def self.new(attributes)
        attributes = attributes.transform_keys(&:to_sym)

        attributes[:d] =
          case attributes.fetch(:op)
          when Opcodes[:dispatch]
            Events.const_get(attributes[:t].to_s.split('_').map(&:capitalize).join)
          when Opcodes[:reconnect] then Events::Reconnect
          when Opcodes[:invalid_session] then Events::InvalidSession
          when Opcodes[:hello] then Events::Hello
          when Opcodes[:heartbeat_ack] then Events::HeartbeatAck
          else raise
          end.new(attributes[:d])

        super
      end
    end
  end
end
