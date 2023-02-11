# frozen_string_literal: true

require 'uri'
require 'async/http/internet'
require_relative 'application_command'
require_relative 'interaction'
require_relative 'application_role_connection_metadata'
require_relative 'audit_log'
require_relative 'auto_moderation'
require_relative 'channel'
require_relative 'emoji'
require_relative 'guild'
require_relative 'guild_scheduled_event'
require_relative 'guild_template'
require_relative 'invite'
require_relative 'stage_instance'
require_relative 'sticker'
require_relative 'user'
require_relative 'voice'
require_relative 'webhook'
require_relative 'gateway'
require_relative 'oauth'

module DiscordAsync
  module REST
    class Client
      include REST::Interaction
      include REST::ApplicationCommand
      include REST::ApplicationRoleConnectionMetadata
      include REST::AuditLog
      include REST::AutoModeration
      include REST::Channel
      include REST::Emoji
      include REST::Guild
      include REST::GuildScheduledEvent
      include REST::GuildTemplate
      include REST::Invite
      include REST::StageInstance
      include REST::Sticker
      include REST::User
      include REST::Voice
      include REST::Webhook
      include REST::Gateway
      include REST::Oauth

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
