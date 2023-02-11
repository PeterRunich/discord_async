# frozen_string_literal: true

require_relative 'base'
require_relative '../../types'
require_relative '../../resources/snowflake'
require_relative '../../resources/guild/guild_member'

module DiscordAsync
  class Gateway
    module Events
      class TypingStart < Base
        attribute :channel_id, Types::Snowflake
        attribute? :guild_id, Types::Snowflake
        attribute :user_id, Types::Snowflake
        attribute :timestamp, Types::Coercible::Integer
        attribute? :member, Resources::Guild::GuildMember
      end
    end
  end
end
