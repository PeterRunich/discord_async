# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Application
      module Command
        PermissionTypes = Types::Coercible::Integer.enum(
          1 => :role,
          2 => :user,
          3 => :channel
        )
      end
    end
  end
end
