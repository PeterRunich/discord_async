# frozen_string_literal: true

require 'uri'
require 'async/http/internet'

module DiscordAsync
  module REST
    class Client
      include Interaction
      include ApplicationCommand
      include ApplicationRoleConnectionMetadata
      include AuditLog
      include AutoModeration
      include Channel
      include Emoji
      include Guild
      include GuildScheduledEvent
      include GuildTemplate
      include Invite
      include StageInstance
      include Sticker
      include User
      include Voice
      include Webhook
      include Gateway
      include Oauth

      def initialize(bot_token, app_id, base_url: 'https://discord.com', version: 10)
        @bot_token = bot_token
        @app_id    = app_id
        @base_url  = "#{base_url}/api/v#{version}"

        @internet = Async::HTTP::Internet.new
      end

      def close = @internet.close

      private

      def params(**kwargs)
        params = URI.encode_www_form(kwargs.compact)
        params.empty? ? '' : "?#{params}"
      end

      def default_headers
        [['Authorization', "Bot #{@bot_token}"], %w[Accept application/json], %w[Content-Type application/json]]
      end
    end
  end
end
