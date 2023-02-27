# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Team
      MembershipStates = Types::Integer.enum(1 => :invited, 2 => :accepted)
    end
  end
end
