# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Team
      class Member < StructBase
        attribute :membership_state, MembershipStates
        attribute :permissions, Types::Array.of(Types::Coercible::String)
        attribute :team_id, Snowflake
        attribute :user, User::PartialUser
      end
    end
  end
end
