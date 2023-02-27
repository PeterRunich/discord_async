# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class ThreadListSync < Base
        attribute :guild_id, Resources::Snowflake
        attribute? :channel_ids, Types::Array.of(Resources::Snowflake)
        attribute :threads, Types::Array.of(Resources::Channel::Channel)
        attribute :members, Types::Array.of(Resources::Channel::ThreadMember)
      end
    end
  end
end
