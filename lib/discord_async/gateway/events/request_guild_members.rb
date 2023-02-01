require_relative 'base'
require_relative '../../resources/snowflake'

module DiscordAsync
  class Gateway
    module Events
      class RequestGuildMembers < Base
        attribute :guild_id, Types::Snowflake
        attribute? :query, Types::Coercible::String
        attribute :limit, Types::Coercible::Integer
        attribute? :presences, Types::Bool
        attribute? :user_ids, Types::Coercible::Array.of(Types::Snowflake)
        attribute? :nonce, Types::Coercible::String
      end
    end
  end
end
