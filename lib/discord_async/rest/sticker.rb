# frozen_string_literal: true

module DiscordAsync
  module REST
    module Sticker
      def get_sticker(sticker_id)
        @internet.get "#{@base_url}/stickers/#{sticker_id}"
      end

      def list_nitro_sticker_packs
        @internet.get "#{@base_url}/sticker-packs"
      end

      def list_guild_stickers(guild_id)
        @internet.get "#{@base_url}/guilds/#{guild_id}/stickers"
      end

      def get_guild_sticker(guild_id, sticker_id)
        @internet.get "#{@base_url}/guilds/#{guild_id}/stickers/#{sticker_id}"
      end

      def create_guild_sticker(guild_id, body)
        @internet.post "#{@base_url}/guilds/#{guild_id}/stickers", default_headers, body
      end

      def modify_guild_sticker(guild_id, sticker_id, body)
        @internet.patch "#{@base_url}/guilds/#{guild_id}/stickers/#{sticker_id}", default_headers, body
      end

      def delete_guild_sticker(guild_id, sticker_id)
        @internet.delete "#{@base_url}/guilds/#{guild_id}/stickers/#{sticker_id}"
      end
    end
  end
end
