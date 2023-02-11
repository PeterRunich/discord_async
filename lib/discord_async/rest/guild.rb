# frozen_string_literal: true

module DiscordAsync
  module REST
    module Guild
      def create_guild(body)
        @internet.post "#{@base_url}/guilds", default_headers, body
      end

      def get_guild(guild_id, with_counts: nil)
        @internet.get "#{@base_url}/guilds/#{guild_id}+#{params({ with_counts: })}"
      end

      def get_guild_preview(guild_id)
        @internet.get "#{@base_url}/guilds/#{guild_id}/preview"
      end

      def modify_guild(guild_id, body)
        @internet.patch "#{@base_url}/guilds/#{guild_id}", default_headers, body
      end

      def delete_guild(guild_id)
        @internet.delete "#{@base_url}/guilds/#{guild_id}"
      end

      def get_guild_channels(guild_id)
        @internet.get "#{@base_url}/guilds/#{guild_id}/channels"
      end

      def create_guild_channel(guild_id, body)
        @internet.post "#{@base_url}/guilds/#{guild_id}/channels", default_headers, body
      end

      def modify_guild_channel_positions(guild_id, body)
        @internet.patch "#{@base_url}/guilds/#{guild_id}/channels", default_headers, body
      end

      def list_active_guild_threads(guild_id)
        @internet.get "#{@base_url}/guilds/#{guild_id}/threads/active"
      end

      def get_guild_member(guild_id, user_id)
        @internet.get "#{@base_url}/guilds/#{guild_id}/members/#{user_id}"
      end

      def list_guild_members(guild_id, limit: 1, after: 0)
        @internet.get "#{@base_url}/guilds/#{guild_id}/members#{params({ limit:, after: })}"
      end

      def search_guild_members(guild_id, query, limit: 1)
        @internet.get "#{@base_url}/guilds/#{guild_id}/members/search#{params({ query:, limit: })}"
      end

      def add_guild_member(guild_id, user_id, body)
        @internet.put "#{@base_url}/guilds/#{guild_id}/members/#{user_id}", default_headers, body
      end

      def modify_guild_member(guild_id, user_id, body)
        @internet.patch "#{@base_url}/guilds/#{guild_id}/members/#{user_id}", default_headers, body
      end

      def modify_current_member(guild_id, body)
        @internet.patch "#{@base_url}/guilds/#{guild_id}/members/@me", default_headers, body
      end

      def add_guild_member_role(guild_id, user_id, role_id)
        @internet.put "#{@base_url}/guilds/#{guild_id}/members/#{user_id}/roles/#{role_id}"
      end

      def remove_guild_member_role(guild_id, user_id, role_id)
        @internet.delete "#{@base_url}/guilds/#{guild_id}/members/#{user_id}/roles/#{role_id}"
      end

      def remove_guild_member(guild_id, user_id)
        @internet.delete "#{@base_url}/guilds/#{guild_id}/members/#{user_id}"
      end

      def get_guild_bans(guild_id, limit: nil, before: nil, after: nil)
        @internet.get "#{@base_url}/guilds/#{guild_id}/bans#{params({ limit:, before:, after: })}"
      end

      def get_guild_ban(guild_id, user_id)
        @internet.get "#{@base_url}/guilds/#{guild_id}/bans/#{user_id}"
      end

      def create_guild_ban(guild_id, user_id, body)
        @internet.put "#{@base_url}/guilds/#{guild_id}/bans/#{user_id}", default_headers, body
      end

      def remove_guild_ban(guild_id, user_id)
        @internet.delete "#{@base_url}/guilds/#{guild_id}/bans/#{user_id}"
      end

      def get_guild_roles(guild_id)
        @internet.get "#{@base_url}/guilds/#{guild_id}/roles"
      end

      def create_guild_role(guild_id, body)
        @internet.post "#{@base_url}/guilds/#{guild_id}/roles", default_headers, body
      end

      def modify_guild_role_positions(guild_id, body)
        @internet.patch "#{@base_url}/guilds/#{guild_id}/roles", default_headers, body
      end

      def modify_guild_role(guild_id, role_id, body)
        @internet.patch "#{@base_url}/guilds/#{guild_id}/roles/#{role_id}", default_headers, body
      end

      def modify_guild_mfa_level(guild_id, body)
        @internet.post "#{@base_url}/guilds/#{guild_id}/mfa", default_headers, body
      end

      def delete_guild_role(guild_id, role_id)
        @internet.delete "#{@base_url}/guilds/#{guild_id}/roles/#{role_id}"
      end

      def get_guild_prune_count(guild_id, days:, include_roles:)
        @internet.get "#{@base_url}/guilds/#{guild_id}/prune#{params({ days:, include_roles: })}"
      end

      def begin_guild_prune(guild_id, body)
        @internet.post "#{@base_url}/guilds/#{guild_id}/prune", default_headers, body
      end

      def get_guild_voice_regions(guild_id)
        @internet.get "#{@base_url}/guilds/#{guild_id}/regions"
      end

      def get_guild_invites(guild_id)
        @internet.get "#{@base_url}/guilds/#{guild_id}/invites"
      end

      def get_guild_integrations(guild_id)
        @internet.get "#{@base_url}/guilds/#{guild_id}/integrations"
      end

      def delete_guild_integration(guild_id, integration_id)
        @internet.delete "#{@base_url}/guilds/#{guild_id}/integrations/#{integration_id}"
      end

      def get_guild_widget_settings(guild_id)
        @internet.get "#{@base_url}/guilds/#{guild_id}/widget"
      end

      def modify_guild_widget(guild_id, body)
        @internet.patch "#{@base_url}/guilds/#{guild_id}/widget", default_headers, body
      end

      def get_guild_widget(guild_id)
        @internet.get "#{@base_url}/guilds/#{guild_id}/widget.json"
      end

      def get_guild_vanity_url(guild_id)
        @internet.get "#{@base_url}/guilds/#{guild_id}/vanity-url"
      end

      def get_guild_widget_image(guild_id, style: 'shield')
        @internet.get "#{@base_url}/guilds/#{guild_id}/widget.png#{params({ style: })}"
      end

      def get_guild_welcome_screen(guild_id)
        @internet.get "#{@base_url}/guilds/#{guild_id}/welcome-screen"
      end

      def modify_guild_welcome_screen(guild_id, body)
        @internet.patch "#{@base_url}/guilds/#{guild_id}/welcome-screen", default_headers, body
      end

      def modify_current_user_voice_state(guild_id, body)
        @internet.patch "#{@base_url}/guilds/#{guild_id}/voice-states/@me", default_headers, body
      end

      def modify_user_voice_state(guild_id, user_id, body)
        @internet.patch "#{@base_url}/guilds/#{guild_id}/voice-states/#{user_id}", default_headers, body
      end
    end
  end
end
