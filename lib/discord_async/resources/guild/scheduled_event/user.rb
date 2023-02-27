# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Guild
      module ScheduledEvent
        class User < StructBase
          attribute :guild_scheduled_event_id, Snowflake
          attribute :user, Resources::User::User
          attribute? :member, Member
        end
      end
    end
  end
end
