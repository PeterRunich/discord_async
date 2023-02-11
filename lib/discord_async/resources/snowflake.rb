# frozen_string_literal: true

module DiscordAsync
  class Snowflake
    def initialize(value)
      @value = Types::Coercible::Integer[value]
    end

    def internal_worker_id
      (@value & 0x3E0000) >> 17
    end

    def internal_process_id
      (@value & 0x1F000) >> 12
    end

    def increment
      @value & 0xFFF
    end

    def to_s
      @value.to_s
    end

    def to_time
      Time.at ((@value >> 22) + 1_420_070_400_000) / 1000.0
    end
  end

  module Types
    Snowflake = Types.Constructor(Snowflake)
  end
end
