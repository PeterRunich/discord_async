# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Interaction
      class MessageComponentData < StructBase
        attribute :custom_id, Types::Coercible::String
        attribute :component_type, Component::ComponentTypes
        attribute? :values, Types::Array.of(SelectOption)
      end
    end
  end
end
