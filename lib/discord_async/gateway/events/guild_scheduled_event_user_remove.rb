# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class GuildScheduledEventUserRemove < Base
        attribute :guild_scheduled_event_id, Resources::Snowflake
        attribute :user_id, Resources::Snowflake
        attribute :guild_id, Resources::Snowflake
      end
    end
  end
end
