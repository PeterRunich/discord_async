# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class ChannelPinsUpdate < Base
        attribute? :guild_id, Resources::Snowflake
        attribute :channel_id, Resources::Snowflake
        attribute? :last_pin_timestamp, Types::TimestampISO8601.optional
      end
    end
  end
end
