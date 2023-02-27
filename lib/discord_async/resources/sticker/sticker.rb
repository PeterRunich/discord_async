# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Sticker
      class Sticker < StructBase
        attribute :id, Snowflake
        attribute? :pack_id, Snowflake
        attribute :name, Types::Coercible::String
        attribute :description, Types::Coercible::String.optional
        attribute :tags, Types::Coercible::String
        attribute? :asset, Types::Coercible::String
        attribute :type, Types::Coercible::Integer
        attribute :format_type, Types::Coercible::Integer
        attribute? :available, Types::Bool
        attribute? :guild_id, Snowflake
        attribute? :user, User::User
        attribute? :sort_value, Types::Coercible::Integer
      end
    end
  end
end
