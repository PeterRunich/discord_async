module DiscordAsync
  module REST
    module Emoji
      def list_guild_emojis(guild_id)
        @internet.get "#{@base_url}/guilds/#{guild_id}/emojis"
      end

      def get_guild_emoji(guild_id, emoji_id)
        @internet.get "#{@base_url}/guilds/#{guild_id}/emojis/#{emoji_id}"
      end

      def create_guild_emoji(guild_id, body)
        @internet.post "#{@base_url}/guilds/#{guild_id}/emojis", default_headers, body
      end

      def modify_guild_emoji(guild_id, emoji_id, body)
        @internet.patch "#{@base_url}/guilds/#{guild_id}/emojis/#{emoji_id}", default_headers, body
      end

      def delete_guild_emoji(guild_id, emoji_id)
        @internet.delete "#{@base_url}/guilds/#{guild_id}/emojis/#{emoji_id}"
      end
    end
  end
end