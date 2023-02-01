module DiscordAsync
  module REST
    module GuildTemplate
      def get_guild_template(template_code)
        @internet.get "#{@base_url}/guilds/templates/#{template_code}"
      end

      def create_guild_from_guild_template(template_code, body)
        @internet.post "#{@base_url}/guilds/templates/#{template_code}", default_headers, body
      end

      def get_guild_templates(guild_id)
        @internet.get "#{@base_url}/guilds/#{guild_id}/templates"
      end

      def create_guild_template(guild_id, body)
        @internet.post "#{@base_url}/guilds/#{guild_id}/templates", default_headers, body
      end

      def sync_guild_template(guild_id, template_code)
        @internet.put "#{@base_url}/guilds/#{guild_id}/templates/#{template_code}"
      end

      def modify_guild_template(guild_id, template_code, body)
        @internet.patch "#{@base_url}/guilds/#{guild_id}/templates/#{template_code}", default_headers, body
      end

      def delete_guild_template(guild_id, template_code)
        @internet.delete "#{@base_url}/guilds/#{guild_id}/templates/#{template_code}"
      end
    end
  end
end
