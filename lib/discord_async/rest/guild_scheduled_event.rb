module DiscordAsync
  module REST
    module GuildScheduledEvent
      def list_scheduled_events_for_guild(guild_id, with_user_count: nil)
        @internet.get "#{@base_url}/guilds/#{guild_id}/scheduled-events#{params({ with_user_count: })}"
      end

      def create_guild_scheduled_event(guild_id, body)
        @internet.post "#{@base_url}/guilds/#{guild_id}/scheduled-events", default_headers, body
      end

      def get_guild_scheduled_event(guild_id, guild_scheduled_event_id, with_user_count: nil)
        @internet.get "#{@base_url}/guilds/#{guild_id}/scheduled-events/#{guild_scheduled_event_id}#{params({ with_user_count: })}"
      end

      def modify_guild_scheduled_event(guild_id, guild_scheduled_event_id, body)
        @internet.patch "#{@base_url}/guilds/#{guild_id}/scheduled-events/#{guild_scheduled_event_id}", default_headers, body
      end

      def delete_guild_scheduled_event(guild_id, guild_scheduled_event_id)
        @internet.delete "#{@base_url}/guilds/#{guild_id}/scheduled-events/#{guild_scheduled_event_id}"
      end

      def get_guild_scheduled_event_users(guild_id, guild_scheduled_event_id, limit: nil, with_member: nil, before: nil, after: nil)
        @internet.get "#{@base_url}/guilds/#{guild_id}/scheduled-events/#{guild_scheduled_event_id}/users#{params({ limit:, with_member:, before:, after: })}"
      end
    end
  end
end

