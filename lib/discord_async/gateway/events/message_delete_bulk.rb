# frozen_string_literal: true

module DiscordAsync
  class Gateway
    module Events
      class MessageDeleteBulk < Base
        attribute :ids, Types::Array.of(Types::Snowflake)
        attribute :channel_id, Types::Snowflake
        attribute? :guild_id, Types::Snowflake
      end
    end
  end
end
