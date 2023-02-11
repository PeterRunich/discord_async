# frozen_string_literal: true

require_relative '../types'
require_relative 'snowflake'

module DiscordAsync
  module Resources
    class RoleTags < Dry::Struct
      transform_keys(&:to_sym)

      attribute? :bot_id, Types::Snowflake
      attribute? :integration_id, Types::Snowflake
      attribute? :subscription_listing_id, Types::Snowflake
      # Tags with type null represent booleans. They will be present and set to null if they are "true", and will be not present if they are "false".
      attribute? :premium_subscriber, Types::Nominal::Any
      attribute? :available_for_purchase, Types::Nominal::Any
      attribute? :guild_connections, Types::Nominal::Any
    end
  end
end
