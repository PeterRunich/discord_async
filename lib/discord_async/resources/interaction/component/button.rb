# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Interaction
      module Component
        class Button < StructBase
          attribute :type, Types.Value(ComponentTypes[:button])
          attribute :style, ButtonStyles
          attribute? :label, Types::Coercible::String
          attribute? :emoji, PartialEmoji
          attribute? :custom_id, Types::Coercible::String
          attribute? :url, Types::Coercible::String
          attribute? :disabled, Types::Bool.default(false)
        end
      end
    end
  end
end
