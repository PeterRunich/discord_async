# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Invite
      TargetTypes = Types::Coercible::Integer.enum(
        1 => :stream,
        2 => :embedded_application
      )
    end
  end
end
