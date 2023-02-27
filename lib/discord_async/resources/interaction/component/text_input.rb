# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Interaction
      module Component
        class TextInput < StructBase
          attribute :type, Types.Value(ComponentTypes[:text_input])
          attribute :custom_id, Types::Coercible::String
          attribute :style, TextInputStyles
          attribute :label, Types::Coercible::String
          attribute? :min_length, Types::Coercible::Integer
          attribute? :max_length, Types::Coercible::Integer
          attribute? :required, Types::Bool
          attribute? :value, Types::Coercible::String
          attribute? :placeholder, Types::Coercible::String
        end
      end
    end
  end
end
