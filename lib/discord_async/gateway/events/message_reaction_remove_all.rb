# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class MessageReactionRemoveAll < Base
        attribute :channel_id, Resources::Snowflake
        attribute :message_id, Resources::Snowflake
        attribute? :guild_id, Resources::Snowflake
      end
    end
  end
end
