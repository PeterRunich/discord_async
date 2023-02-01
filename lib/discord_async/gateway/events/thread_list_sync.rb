require_relative 'base'
require_relative '../../resources/snowflake'
require_relative '../../types'
require_relative '../../resources/channel/channel'
require_relative '../../resources/channel/thread_member'

module DiscordAsync
  class Gateway
    module Events
      class ThreadListSync < Base
        attribute :guild_id, Types::Snowflake
        attribute? :channel_ids, Types::Array.of(Types::Snowflake)
        attribute :threads, Types::Array.of(Resources::Channel)
        attribute :members, Types::Array.of(Resources::Channel::ThreadMember)
      end
    end
  end
end
