# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Interaction
      class ModalSubmitData < StructBase
        attribute :custom_id, Types::Coercible::String
        attribute :components, Types::Array.of(Component::ActionRow)
      end
    end
  end
end
