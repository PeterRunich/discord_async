# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Guild
      module ScheduledEvent
        class EntityMetadata < StructBase
          attribute? :location, Types::Coercible::String
        end
      end
    end
  end
end
