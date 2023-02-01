require 'dry-struct'
require_relative '../../types'
require_relative '../snowflake'

module DiscordAsync
  module Resources
    class Application
      class ApplicationCommandPermissions < Dry::Struct
        transform_keys(&:to_sym)

        attribute :id, Types::Snowflake
        attribute :type, Types::Coercible::Integer
        attribute :permissions, Types::Bool
      end
    end
  end
end

