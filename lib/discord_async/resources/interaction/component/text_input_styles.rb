# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Interaction
      module Component
        TextInputStyles = Types::Coercible::Integer.enum(
          1 => :short,
          2 => :paragraph
        )
      end
    end
  end
end
