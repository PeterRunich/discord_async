# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Application < StructBase
      class PartialApplication < StructBase
        attribute :id, Types::Snowflake
        attribute? :flags, Types::Coercible::Integer
      end
    end
  end
end
