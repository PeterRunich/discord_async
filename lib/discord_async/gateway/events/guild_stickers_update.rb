require_relative 'base'
require_relative '../../resources/snowflake'

module DiscordAsync
  class Gateway
    module Events
      class GuildStickersUpdate < Base
        attribute :guild_id, Types::Snowflake
        attribute :stickers, Types::Array.of(Types::Snowflake)
      end
    end
  end
end
