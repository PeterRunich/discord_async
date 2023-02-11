# frozen_string_literal: true

module DiscordAsync
  module REST
    module Webhook
      def create_webhook(channel_id, body)
        @internet.post "#{@base_url}/channels/#{channel_id}/webhooks", default_headers, body
      end

      def get_channel_webhooks(channel_id)
        @internet.get "#{@base_url}/channels/#{channel_id}/webhooks"
      end

      def get_guild_webhooks(guild_id)
        @internet.get "#{@base_url}/guilds/#{guild_id}/webhooks"
      end

      def get_webhook(webhook_id)
        @internet.get "#{@base_url}/webhooks/#{webhook_id}"
      end

      def get_webhook_with_token(webhook_id, webhook_token)
        @internet.get "#{@base_url}/webhooks/#{webhook_id}/#{webhook_token}"
      end

      def modify_webhook(webhook_id, body)
        @internet.patch "#{@base_url}/webhooks/#{webhook_id}", default_headers, body
      end

      def modify_webhook_with_token(webhook_id, webhook_token, body)
        @internet.patch "#{@base_url}/webhooks/#{webhook_id}/#{webhook_token}", default_headers, body
      end

      def delete_webhook(webhook_id)
        @internet.delete "#{@base_url}/webhooks/#{webhook_id}"
      end

      def delete_webhook_with_token(webhook_id, webhook_token)
        @internet.delete "#{@base_url}/webhooks/#{webhook_id}/#{webhook_token}"
      end

      def execute_webhook(webhook_id, webhook_token, body, wait: false, thread_id: nil)
        @internet.post "#{@base_url}/webhooks/#{webhook_id}/#{webhook_token}#{params({ wait:, thread_id: })}",
                       default_headers, body
      end

      def execute_slack_compatible_webhook(webhook_id, webhook_token, body, wait: true, thread_id: nil)
        @internet.post "#{@base_url}/webhooks/#{webhook_id}/#{webhook_token}/slack#{params({ wait:, thread_id: })}",
                       default_headers, body
      end

      def execute_github_compatible_webhook(webhook_id, webhook_token, body, wait: true, thread_id: nil)
        @internet.post "#{@base_url}/webhooks/#{webhook_id}/#{webhook_token}/github#{params({ wait:, thread_id: })}",
                       default_headers, body
      end

      def get_webhook_message(webhook_id, webhook_token, message_id, thread_id: nil)
        @internet.get "#{@base_url}/webhooks/#{webhook_id}/#{webhook_token}/messages/#{message_id}#{params({ thread_id: })}"
      end

      def edit_webhook_message(webhook_id, webhook_token, message_id, body, thread_id: nil)
        @internet.patch "#{@base_url}/webhooks/#{webhook_id}/#{webhook_token}/messages/#{message_id}#{params({ thread_id: })}",
                        default_headers, body
      end

      def delete_webhook_message(webhook_id, webhook_token, message_id, thread_id: nil)
        @internet.delete "#{@base_url}/webhooks/#{webhook_id}/#{webhook_token}/messages/#{message_id}#{params({ thread_id: })}"
      end
    end
  end
end
