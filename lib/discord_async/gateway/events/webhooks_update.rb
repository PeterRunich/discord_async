require_relative 'base'
require_relative '../../resources/snowflake'

module DiscordAsync
  class Gateway
    module Events
      class WebhooksUpdate < Base
        attribute :guild_id, Types::Snowflake
        attribute :channel_id, Types::Snowflake
      end
    end
  end
end
