# frozen_string_literal: true

module DiscordAsync
  class Gateway
    module Events
      class IntegrationDelete < Base
        attribute :id, Types::Snowflake
        attribute :guild_id, Types::Snowflake
        attribute? :application_id, Types::Snowflake
      end
    end
  end
end
