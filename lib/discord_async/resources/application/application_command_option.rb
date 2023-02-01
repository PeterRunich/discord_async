require 'dry-struct'
require_relative '../../types'
require_relative '../snowflake'
require_relative 'application_command_option_choice'

module DiscordAsync
  module Resources
    class Application < Dry::Struct
      class ApplicationCommandOption < Dry::Struct
        ApplicationCommandOptionTypes = Types::Integer.enum(
          1 => :sub_command,
          2 => :sub_command_group,
          3 => :string,
          4 => :integer,
          5 => :boolean,
          6 => :user,
          7 => :channel,
          8 => :role,
          9 => :mentionable,
          10 => :number,
          11 => :attachment
        )

        transform_keys(&:to_sym)

        attribute :type, ApplicationCommandOptionTypes
        attribute :name, Types::Coercible::String
        attribute? :name_localization, Types::Hash.optional
        attribute :description, Types::Coercible::String.default(''.freeze)
        attribute? :description_localization, Types::Hash.optional
        attribute? :required, Types::Bool.default(false)
        attribute? :choices, Types::Array.of(Application::ApplicationCommandOptionChoice)
        attribute? :options, Types::Array.of(ApplicationCommandOption)
        attribute? :channel_types, Types::Array.of(Types::Coercible::Integer)
        attribute? :min_value, Types::Integer | Types::Float
        attribute? :max_value, Types::Integer | Types::Float
        attribute? :min_length, Types::Coercible::Integer
        attribute? :max_length, Types::Coercible::Integer
        attribute? :autocomplete, Types::Bool
      end
    end
  end
end

