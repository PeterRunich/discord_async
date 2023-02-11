# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Application < Dry::Struct
      class ApplicationCommandOptionChoice < Dry::Struct
        transform_keys(&:to_sym)

        attribute :name, Types::Coercible::String
        attribute? :name_localization, Types::Hash.optional
        attribute :value, Types::String | Types::Integer | Types::Float
      end
    end
  end
end
