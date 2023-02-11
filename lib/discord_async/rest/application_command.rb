# frozen_string_literal: true

module DiscordAsync
  module REST
    module ApplicationCommand
      def get_global_application_commands(with_localizations: nil)
        @internet.get "#{@base_url}/applications/#{@app_id}/commands#{params({ with_localizations: })}"
      end

      def create_global_application_command(body)
        @internet.post "#{@base_url}/applications/#{@app_id}/commands", default_headers, body
      end

      def get_global_application_command(command_id)
        @internet.get "#{@base_url}/applications/#{@app_id}/commands/#{command_id}"
      end

      def edit_global_application_command(command_id, body)
        @internet.patch "#{@base_url}/applications/#{@app_id}/commands/#{command_id}", default_headers, body
      end

      def delete_global_application_command(command_id)
        @internet.delete "#{@base_url}/applications/#{@app_id}/commands/#{command_id}"
      end

      def bulk_overwrite_global_application_commands(body)
        @internet.put "#{@base_url}/applications/#{@app_id}/commands", default_headers, body
      end

      def get_guild_application_commands(guild_id, with_localizations: nil)
        @internet.get "#{@base_url}/applications/#{@app_id}/guilds/#{guild_id}/commands#{params({ with_localizations: })}"
      end

      def create_guild_application_command(guild_id, body)
        @internet.post "#{@base_url}/applications/#{@app_id}/guilds/#{guild_id}/commands", default_headers, body
      end

      def get_guild_application_command(guild_id, command_id)
        @internet.get "#{@base_url}/applications/#{@app_id}/guilds/#{guild_id}/commands/#{command_id}"
      end

      def edit_guild_application_command(guild_id, command_id, body)
        @internet.patch "#{@base_url}/applications/#{@app_id}/guilds/#{guild_id}/commands/#{command_id}",
                        default_headers, body
      end

      def delete_guild_application_command(guild_id, command_id)
        @internet.delete "#{@base_url}/applications/#{@app_id}/guilds/#{guild_id}/commands/#{command_id}"
      end

      def bulk_overwrite_guild_application_commands(guild_id, body)
        @internet.put "#{@base_url}/applications/#{@app_id}/guilds/#{guild_id}/commands", default_headers, body
      end

      def get_guild_application_command_permissions(guild_id)
        @internet.get "#{@base_url}/applications/#{@app_id}/guilds/#{guild_id}/commands/permissions"
      end

      def get_application_command_permissions(guild_id, command_id)
        @internet.get "#{@base_url}/applications/#{@app_id}/guilds/#{guild_id}/commands/#{command_id}/permissions"
      end

      def edit_application_command_permissions(guild_id, command_id, body)
        @internet.put "#{@base_url}/applications/#{@app_id}/guilds/#{guild_id}/commands/#{command_id}/permissions",
                      default_headers, body
      end
    end
  end
end
