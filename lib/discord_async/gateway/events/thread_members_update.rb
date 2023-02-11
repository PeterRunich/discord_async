# frozen_string_literal: true

require_relative 'base'
require_relative '../../resources/snowflake'
require_relative '../../resources/channel/thread_member'
require_relative '../../types'

module DiscordAsync
  class Gateway
    module Events
      class ThreadMembersUpdate < Base
        attribute :id, Types::Snowflake
        attribute :guild_id, Types::Snowflake
        attribute :member_count, Types::Coercible::Integer
        attribute? :added_members, Types::Array.of(Resources::Channel::ThreadMember)
        attribute? :removed_member_ids, Types::Array.of(Types::Snowflake)
      end
    end
  end
end
