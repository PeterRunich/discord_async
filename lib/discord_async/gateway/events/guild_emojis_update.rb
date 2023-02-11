# frozen_string_literal: true

require_relative 'base'
require_relative '../../types'
require_relative '../../resources/emoji'

module DiscordAsync
  class Gateway
    module Events
      class GuildEmojisUpdate < Base
        attribute :guild_id, Types::Snowflake
        attribute :emojis, Types::Array.of(Resources::Emoji)
      end
    end
  end
end
