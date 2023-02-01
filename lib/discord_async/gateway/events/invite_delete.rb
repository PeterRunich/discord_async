require_relative 'base'
require_relative '../../resources/snowflake'
require_relative '../../types'

module DiscordAsync
  class Gateway
    module Events
      class InviteDelete < Base
        attribute :channel_id, Types::Snowflake
        attribute? :guild_id, Types::Snowflake
        attribute :code, Types::Coercible::String
      end
    end
  end
end
