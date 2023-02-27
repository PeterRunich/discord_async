# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Interaction
      class SelectOption < StructBase
        attribute :label, Types::Coercible::String
        attribute :value, Types::Coercible::String
        attribute? :description, Types::Coercible::String
        attribute? :emoji, PartialEmoji
        attribute? :default, Types::Bool
      end
    end
  end
end
