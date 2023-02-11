# frozen_string_literal: true

module DiscordAsync
  class Gateway
    module Events
      class MessageReactionRemove < Base
        attribute :user_id, Types::Snowflake
        attribute :channel_id, Types::Snowflake
        attribute :message_id, Types::Snowflake
        attribute? :guild_id, Types::Snowflake
        attribute :emoji, Resources::PartialEmoji
      end
    end
  end
end
