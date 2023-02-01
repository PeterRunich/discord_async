module DiscordAsync
  module REST
    module AuditLog
      def get_guild_audit_log(guild_id)
        @internet.get "#{@base_url}/guilds/#{guild_id}/audit-logs"
      end
    end
  end
end