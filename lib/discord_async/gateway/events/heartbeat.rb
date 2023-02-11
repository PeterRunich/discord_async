# frozen_string_literal: true

module DiscordAsync
  class Gateway
    module Events
      class Heartbeat < Base
        attribute :last_sequence_number, Types::Coercible::Integer

        def initialize(last_sequence_number)
          super(last_sequence_number:)
        end
      end
    end
  end
end
