# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Voice
      class Region < StructBase
        attribute :id, Types::Coercible::String
        attribute :name, Types::Coercible::String
        attribute :optimal, Types::Bool
        attribute :deprecated, Types::Bool
        attribute :custom, Types::Bool
      end
    end
  end
end
