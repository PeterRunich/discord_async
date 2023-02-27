# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class GuildMembersChunk < Base
        attribute :guild_id, Resources::Snowflake
        attribute :members, Types::Array.of(Resources::Guild::Member)
        attribute :chunk_index, Types::Coercible::Integer
        attribute :chunk_count, Types::Coercible::Integer
        attribute? :not_found, Types::Array.of(Types::Coercible::String)
        attribute? :presences, Types::Array.of(PresenceUpdate)
        attribute? :nonce, Types::Coercible::String
      end
    end
  end
end
