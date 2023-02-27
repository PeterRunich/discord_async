# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Interaction
      module Component
        ButtonStyles = Types::Coercible::Integer.enum(
          1 => :primary,
          2 => :secondary,
          3 => :success,
          4 => :danger,
          5 => :link
        )
      end
    end
  end
end
