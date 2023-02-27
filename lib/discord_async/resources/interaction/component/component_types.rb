# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Interaction
      module Component
        ComponentTypes = Types::Coercible::Integer.enum(
          1 => :action_row,
          2 => :button,
          3 => :string_select,
          4 => :text_input,
          5 => :user_select,
          6 => :role_select,
          7 => :mentionable_select,
          8 => :channel_select
        )
      end
    end
  end
end
