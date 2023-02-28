# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      module Send
        class Heartbeat < StructBase
          attribute :last_sequence_number, Types::Coercible::String

          def self.new(last_sequence_number_arg=nil, last_sequence_number: nil)
            super(last_sequence_number: (last_sequence_number_arg || last_sequence_number))
          end

          def to_event_data
            last_sequence_number
          end
        end
      end
    end
  end
end

