# frozen_string_literal: true

module DiscordAsync
  module Resources
    class PartialEmoji < StructBase
      attribute :id, Snowflake.optional
      attribute? :name, Types::String.optional
      attribute? :roles, Types::Array.of(Snowflake)
      attribute? :user, User::User
      attribute? :require_colons, Types::Bool
      attribute? :managed, Types::Bool
      attribute? :animated, Types::Bool
      attribute? :available, Types::Bool
    end
  end
end
