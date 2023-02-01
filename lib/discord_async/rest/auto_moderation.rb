module DiscordAsync
  module REST
    module AutoModeration
      def list_auto_moderation_rules_for_guild(guild_id)
        @internet.get "#{@base_url}/guilds/#{guild_id}/auto-moderation/rules"
      end

      def get_auto_moderation_rule(guild_id, auto_moderation_rule_id)
        @internet.get "#{@base_url}/guilds/#{guild_id}/auto-moderation/rules/#{auto_moderation_rule_id}"
      end

      def create_auto_moderation_rule(guild_id, body)
        @internet.post "#{@base_url}/guilds/#{guild_id}/auto-moderation/rules", default_headers, body
      end

      def modify_auto_moderation_rule(guild_id, auto_moderation_rule_id, body)
        @internet.patch "#{@base_url}/guilds/#{guild_id}/auto-moderation/rules/#{auto_moderation_rule_id}", default_headers, body
      end

      def delete_auto_moderation_rule(guild_id, auto_moderation_rule_id)
        @internet.delete "#{@base_url}/guilds/#{guild_id}/auto-moderation/rules/#{auto_moderation_rule_id}"
      end
    end
  end
end