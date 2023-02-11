# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Guild < StructBase
      module ScheduledEvent
        class GuildScheduledEventEntityMetadata < StructBase
          attribute? :location, Types::Coercible::String
        end
      end
    end
  end
end
