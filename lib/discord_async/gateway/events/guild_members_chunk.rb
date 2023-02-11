# frozen_string_literal: true

require_relative 'base'
require_relative '../../resources/snowflake'
require_relative '../../resources/guild/guild_member'
require_relative 'presence_update'

module DiscordAsync
  class Gateway
    module Events
      class GuildMembersChunk < Base
        attribute :guild_id, Types::Snowflake
        attribute :members, Types::Array.of(Resources::Guild::GuildMember)
        attribute :chunk_index, Types::Coercible::Integer
        attribute :chunk_count, Types::Coercible::Integer
        attribute? :not_found, Types::Array.of(Types::Coercible::String)
        attribute? :presences, Types::Array.of(PresenceUpdate)
        attribute? :nonce, Types::Coercible::String
      end
    end
  end
end
