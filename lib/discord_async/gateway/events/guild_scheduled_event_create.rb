# frozen_string_literal: true

require_relative 'base'
require_relative '../../resources/guild/scheduled_event/guild_scheduled_event'

module DiscordAsync
  class Gateway
    module Events
      class GuildScheduledEventCreate < Base
        attribute :guild_scheduled_event, Resources::Guild::ScheduledEvent::GuildScheduledEvent
      end
    end
  end
end
