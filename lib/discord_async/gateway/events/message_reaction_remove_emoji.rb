# frozen_string_literal: true

require_relative 'base'
require_relative '../../resources/snowflake'
require_relative '../../resources/emoji'

module DiscordAsync
  class Gateway
    module Events
      class MessageReactionRemoveEmoji < Base
        attribute :channel_id, Types::Snowflake
        attribute? :guild_id, Types::Snowflake
        attribute :message_id, Types::Snowflake
        attribute :emoji, Resources::PartialEmoji
      end
    end
  end
end
