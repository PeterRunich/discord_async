# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class MessageReactionRemove < Base
        attribute :user_id, Resources::Snowflake
        attribute :channel_id, Resources::Snowflake
        attribute :message_id, Resources::Snowflake
        attribute? :guild_id, Resources::Snowflake
        attribute :emoji, Resources::PartialEmoji
      end
    end
  end
end
