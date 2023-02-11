# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Interaction < Dry::Struct
      class ApplicationCommandInteractionDataOption < Dry::Struct
        attribute :name, Types::Coercible::String
        attribute :type, ApplicationCommandOption::ApplicationCommandOptionTypes
        attribute? :value, Types::String | Types::Integer | Types::Float | Types::Bool
        attribute? :options, Types::Array.of(ApplicationCommandInteractionDataOption)
        attribute? :focused, Types::Bool
      end
    end
  end
end
