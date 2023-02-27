# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class MessageReactionAdd < Base
        attribute :user_id, Resources::Snowflake
        attribute :channel_id, Resources::Snowflake
        attribute :message_id, Resources::Snowflake
        attribute? :guild_id, Resources::Snowflake
        attribute? :member, Resources::Guild::Member
        attribute :emoji, Resources::PartialEmoji
      end
    end
  end
end
