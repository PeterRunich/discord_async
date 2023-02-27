# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Team
      class Team < StructBase
        attribute :id, Snowflake
        attribute :icon, Types::Coercible::String.optional
        attribute :members, Types::Array.of(Member)
        attribute :name, Types::Coercible::String
        attribute :owner_user_id, Snowflake
      end
    end
  end
end
