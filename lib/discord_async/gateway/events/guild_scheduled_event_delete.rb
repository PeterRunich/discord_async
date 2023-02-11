# frozen_string_literal: true

module DiscordAsync
  class Gateway
    module Events
      class GuildScheduledEventDelete < Base
        attribute :guild_scheduled_event, Resources::Guild::ScheduledEvent::GuildScheduledEvent
      end
    end
  end
end
