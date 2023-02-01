module DiscordAsync
  module REST
    module User
      def get_current_user
        @internet.get "#{@base_url}/users/@me"
      end

      def get_user(user_id)
        @internet.get "#{@base_url}/users/#{user_id}"
      end

      def modify_current_user(body)
        @internet.patch "#{@base_url}/users/@me", default_headers, body
      end

      def get_current_user_guilds(before: nil, after: nil, limit: 200)
        @internet.get "#{@base_url}/users/@me/guilds#{params({ before:, after:, limit: })}"
      end

      def get_current_user_guild_member(guild_id)
        @internet.get "#{@base_url}/users/@me/guilds/#{guild_id}/member"
      end

      def leave_guild(guild_id)
        @internet.delete "#{@base_url}/users/@me/guilds/#{guild_id}"
      end

      def create_dm(body)
        @internet.post "#{@base_url}/users/@me/channels", default_headers, body
      end

      def create_group_dm(body)
        @internet.post "#{@base_url}/users/@me/channels", default_headers, body
      end

      def get_user_connections
        @internet.get "#{@base_url}/users/@me/connections"
      end

      def get_user_application_role_connection
        @internet.get "#{@base_url}/users/@me/applications/#{@app_id}/role-connection"
      end

      def update_user_application_role_connection(body)
        @internet.put "#{@base_url}/users/@me/applications/#{@app_id}/role-connection", default_headers, body
      end
    end
  end
end
