# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class TypingStart < Base
        attribute :channel_id, Resources::Snowflake
        attribute? :guild_id, Resources::Snowflake
        attribute :user_id, Resources::Snowflake
        attribute :timestamp, Types::Coercible::Integer
        attribute? :member, Resources::Guild::Member
      end
    end
  end
end
