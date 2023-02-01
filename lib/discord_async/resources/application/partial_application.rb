require 'dry-struct'
require_relative '../../types'
require_relative '../snowflake'
require_relative 'application_command_option_choice'

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

