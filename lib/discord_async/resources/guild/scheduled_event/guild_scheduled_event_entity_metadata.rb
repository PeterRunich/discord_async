require 'dry-struct'
require_relative '../../../types'

module DiscordAsync
  module Resources
    class Guild < Dry::Struct
      module ScheduledEvent
        class GuildScheduledEventEntityMetadata < Dry::Struct
          transform_keys(&:to_sym)

          attribute? :location, Types::Coercible::String
        end
      end
    end
  end
end