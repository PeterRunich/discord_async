# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Interaction
      module Component
        class ActionRow < StructBase
          attribute :type, Types.Value(ComponentTypes[:action_row])
          attribute :components, Types::Array.of(Button | SelectMenu | TextInput)
        end
      end
    end
  end
end
