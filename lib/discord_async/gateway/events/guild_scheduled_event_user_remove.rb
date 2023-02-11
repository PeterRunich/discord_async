# frozen_string_literal: true

module DiscordAsync
  class Gateway
    module Events
      class GuildScheduledEventUserRemove < Base
        attribute :guild_scheduled_event_id, Types::Snowflake
        attribute :user_id, Types::Snowflake
        attribute :guild_id, Types::Snowflake
      end
    end
  end
end
