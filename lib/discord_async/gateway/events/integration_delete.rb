# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class IntegrationDelete < Base
        attribute :id, Resources::Snowflake
        attribute :guild_id, Resources::Snowflake
        attribute? :application_id, Resources::Snowflake
      end
    end
  end
end
