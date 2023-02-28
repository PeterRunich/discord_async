# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      module Send
        class Base < StructBase
          def to_event_data
            to_h
          end
        end
      end
    end
  end
end

