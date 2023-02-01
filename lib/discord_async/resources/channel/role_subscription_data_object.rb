require 'dry-struct'
require_relative '../../types'

module DiscordAsync
  module Resources
    class Channel < Dry::Struct
      class RoleSubscriptionDataObject < Dry::Struct
        attribute :role_subscription_listing_id, Types::Snowflake
        attribute :tier_name, Types::Coercible::String
        attribute :total_months_subscribed, Types::Coercible::Integer
        attribute :is_renewal, Types::Bool
      end
    end
  end
end