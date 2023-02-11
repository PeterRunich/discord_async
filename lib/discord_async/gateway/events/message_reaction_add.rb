# frozen_string_literal: true

module DiscordAsync
  class Gateway
    module Events
      class MessageReactionAdd < Base
        attribute :user_id, Types::Snowflake
        attribute :channel_id, Types::Snowflake
        attribute :message_id, Types::Snowflake
        attribute? :guild_id, Types::Snowflake
        attribute? :member, Resources::Guild::GuildMember
        attribute :emoji, Resources::PartialEmoji
      end
    end
  end
end
