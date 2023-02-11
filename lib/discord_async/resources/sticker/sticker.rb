# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Sticker < StructBase
      attribute :id, Types::Snowflake
      attribute? :pack_id, Types::Snowflake
      attribute :name, Types::Coercible::String
      attribute :description, Types::Coercible::String.optional
      attribute :tags, Types::Coercible::String
      attribute? :asset, Types::Coercible::String
      attribute :type, Types::Coercible::Integer
      attribute :format_type, Types::Coercible::Integer
      attribute? :available, Types::Bool
      attribute? :guild_id, Types::Snowflake
      attribute? :user, User
      attribute? :sort_value, Types::Coercible::Integer
    end
  end
end
