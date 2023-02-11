# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Application < Dry::Struct
      class PartialApplication < Dry::Struct
        transform_keys(&:to_sym)

        attribute :id, Types::Snowflake
        attribute? :flags, Types::Coercible::Integer
      end
    end
  end
end
