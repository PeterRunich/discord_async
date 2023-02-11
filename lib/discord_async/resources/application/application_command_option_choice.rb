# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Application < StructBase
      class ApplicationCommandOptionChoice < StructBase
        attribute :name, Types::Coercible::String
        attribute? :name_localization, Types::Hash.optional
        attribute :value, Types::String | Types::Integer | Types::Float
      end
    end
  end
end
