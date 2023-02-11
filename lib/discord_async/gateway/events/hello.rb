# frozen_string_literal: true

module DiscordAsync
  class Gateway
    module Events
      class Hello < Base
        attribute :heartbeat_interval, Types::Coercible::Integer

        def heartbeat_interval_in_seconds
          heartbeat_interval / 1000.0
        end
      end
    end
  end
end
