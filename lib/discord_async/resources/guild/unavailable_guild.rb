require 'dry-struct'
require_relative '../../types'
require_relative '../snowflake'

module DiscordAsync
  module Resources
    class Guild < Dry::Struct
      class UnavailableGuild < Dry::Struct
        transform_keys(&:to_sym)

        attribute :id, Types::Snowflake
        attribute? :unavailable, Types::Bool
      end
    end
  end
end