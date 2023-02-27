# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class WebhooksUpdate < Base
        attribute :guild_id, Resources::Snowflake
        attribute :channel_id, Resources::Snowflake
      end
    end
  end
end
