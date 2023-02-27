# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class GuildEmojisUpdate < Base
        attribute :guild_id, Resources::Snowflake
        attribute :emojis, Types::Array.of(Resources::Emoji)
      end
    end
  end
end
