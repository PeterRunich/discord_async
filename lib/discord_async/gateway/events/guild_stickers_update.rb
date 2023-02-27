# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class GuildStickersUpdate < Base
        attribute :guild_id, Resources::Snowflake
        attribute :stickers, Types::Array.of(Resources::Snowflake)
      end
    end
  end
end
