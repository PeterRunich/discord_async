# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Channel
      class RoleSubscriptionDataObject < StructBase
        attribute :role_subscription_listing_id, Snowflake
        attribute :tier_name, Types::Coercible::String
        attribute :total_months_subscribed, Types::Coercible::Integer
        attribute :is_renewal, Types::Bool
      end
    end
  end
end
