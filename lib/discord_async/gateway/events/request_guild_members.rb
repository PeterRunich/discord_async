# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class RequestGuildMembers < Base
        attribute :guild_id, Resources::Snowflake
        attribute? :query, Types::Coercible::String
        attribute :limit, Types::Coercible::Integer
        attribute? :presences, Types::Bool
        attribute? :user_ids, Types::Coercible::Array.of(Resources::Snowflake)
        attribute? :nonce, Types::Coercible::String
      end
    end
  end
end
