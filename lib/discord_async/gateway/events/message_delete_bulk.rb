# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class MessageDeleteBulk < Base
        attribute :ids, Types::Array.of(Resources::Snowflake)
        attribute :channel_id, Resources::Snowflake
        attribute? :guild_id, Resources::Snowflake
      end
    end
  end
end
