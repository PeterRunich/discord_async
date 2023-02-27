# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class GuildScheduledEventCreate < Base
        attribute :guild_scheduled_event, Resources::Guild::ScheduledEvent::ScheduledEvent
      end
    end
  end
end
