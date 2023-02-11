# frozen_string_literal: true

require_relative '../types'
require_relative 'snowflake'
require_relative 'role_tags'

module DiscordAsync
  module Resources
    class Role < Dry::Struct
      transform_keys(&:to_sym)

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
