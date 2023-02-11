# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Role < StructBase
      attribute :id, Types::Snowflake
      attribute :name, Types::Coercible::String
      attribute :color, Types::Coercible::Integer
      attribute :hoist, Types::Bool
      attribute? :icon, Types::Coercible::String.optional
      attribute? :unicode_emoji, Types::Coercible::String.optional
      attribute :position, Types::Coercible::Integer
      attribute :permissions, Types::Coercible::String
      attribute :managed, Types::Bool
      attribute :mentionable, Types::Bool
      attribute? :tags, RoleTags
    end
  end
end
