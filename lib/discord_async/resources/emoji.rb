# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Emoji < StructBase
      attribute :id, Types::Snowflake.optional
      attribute :name, Types::String.optional
      attribute? :roles, Types::Array.of(Types::Snowflake)
      attribute? :user, User
      attribute? :require_colons, Types::Bool
      attribute? :managed, Types::Bool
      attribute? :animated, Types::Bool
      attribute? :available, Types::Bool
    end

    class PartialEmoji < StructBase
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
