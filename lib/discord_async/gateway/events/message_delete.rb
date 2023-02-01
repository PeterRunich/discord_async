require_relative 'base'
require_relative '../../resources/snowflake'

module DiscordAsync
  class Gateway
    module Events
      class MessageDelete < Base
        attribute :id, Types::Snowflake
        attribute :channel_id, Types::Snowflake
        attribute :guild_id, Types::Snowflake
      end
    end
  end
end
