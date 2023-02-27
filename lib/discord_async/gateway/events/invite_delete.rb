# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class InviteDelete < Base
        attribute :channel_id, Resources::Snowflake
        attribute? :guild_id, Resources::Snowflake
        attribute :code, Types::Coercible::String
      end
    end
  end
end
