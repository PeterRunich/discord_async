# frozen_string_literal: true

module DiscordAsync
  class Gateway
    module Events
      class ChannelPinsUpdate < Base
        attribute? :guild_id, Types::Snowflake
        attribute :channel_id, Types::Snowflake
        attribute? :last_pin_timestamp, Types::TimestampISO8601.optional
      end
    end
  end
end
