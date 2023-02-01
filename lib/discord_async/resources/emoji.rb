require 'dry-struct'
require_relative '../types'
require_relative 'snowflake'
require_relative 'user/user'

module DiscordAsync
  module Resources
    class Emoji < Dry::Struct
      transform_keys(&:to_sym)

      attribute :id, Types::Snowflake.optional
      attribute :name, Types::String.optional
      attribute? :roles, Types::Array.of(Types::Snowflake)
      attribute? :user, User
      attribute? :require_colons, Types::Bool
      attribute? :managed, Types::Bool
      attribute? :animated, Types::Bool
      attribute? :available, Types::Bool
    end

    class PartialEmoji < Dry::Struct
      transform_keys(&:to_sym)

      attribute :id, Types::Snowflake.optional
      attribute? :name, Types::String.optional
      attribute? :roles, Types::Array.of(Types::Snowflake)
      attribute? :user, User
      attribute? :require_colons, Types::Bool
      attribute? :managed, Types::Bool
      attribute? :animated, Types::Bool
      attribute? :available, Types::Bool
    end
  end
end