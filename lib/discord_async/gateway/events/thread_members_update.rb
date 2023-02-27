# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class ThreadMembersUpdate < Base
        attribute :id, Resources::Snowflake
        attribute :guild_id, Resources::Snowflake
        attribute :member_count, Types::Coercible::Integer
        attribute? :added_members, Types::Array.of(Resources::Channel::ThreadMember)
        attribute? :removed_member_ids, Types::Array.of(Resources::Snowflake)
      end
    end
  end
end
