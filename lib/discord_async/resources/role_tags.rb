# frozen_string_literal: true

module DiscordAsync
  module Resources
    class RoleTags < StructBase
      attribute? :bot_id, Snowflake
      attribute? :integration_id, Snowflake
      attribute? :subscription_listing_id, Snowflake
      # Tags with type null represent booleans. They will be present and set to null if they are "true", and will be not present if they are "false".
      attribute? :premium_subscriber, Types::Nominal::Any
      attribute? :available_for_purchase, Types::Nominal::Any
      attribute? :guild_connections, Types::Nominal::Any
    end
  end
end
