# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Guild
      module Integration
        ExpireBehaviorTypes = Types::Coercible::Integer.enum(
          0 => :remove_role,
          1 => :kick
        )
      end
    end
  end
end
