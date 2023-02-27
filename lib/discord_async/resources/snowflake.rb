# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Snowflake < StructBase
      attribute :id, Types::Coercible::Integer

      def self.new(attributes)
        attributes = { id: attributes } unless attributes.is_a? Hash
        super
      end

      def internal_worker_id
        (id & 0x3E0000) >> 17
      end

      def internal_process_id
        (id & 0x1F000) >> 12
      end

      def increment
        id & 0xFFF
      end

      def to_s
        id.to_s
      end

      def to_time
        Time.at ((id >> 22) + 1_420_070_400_000) / 1000.0
      end
    end
  end
end
