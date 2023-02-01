module DiscordAsync
  module REST
    module Interaction
      def create_interaction_response(interaction_id, interaction_token, body)
        @internet.post "#{@base_url}/interactions/#{interaction_id}/#{interaction_token}/callback", default_headers, body
      end

      def get_original_interaction_response(interaction_token)
        @internet.get "#{@base_url}/webhooks/#{@app_id}/#{interaction_token}/messages/@original"
      end

      def edit_original_interaction_response(interaction_token, body)
        @internet.patch "#{@base_url}/webhooks/#{@app_id}/#{interaction_token}/messages/@original", default_headers, body
      end

      def delete_original_interaction_response(interaction_token)
        @internet.delete "#{@base_url}/webhooks/#{@app_id}/#{interaction_token}/messages/@original"
      end

      def create_followup_message(interaction_token, body)
        @internet.post "#{@base_url}/webhooks/#{@app_id}/#{interaction_token}", default_headers, body
      end

      def get_followup_message(interaction_token, message_id)
        @internet.get "#{@base_url}/webhooks/#{@app_id}/#{interaction_token}/messages/#{message_id}"
      end

      def edit_followup_message(interaction_token, message_id, body)
        @internet.patch "#{@base_url}/webhooks/#{@app_id}/#{interaction_token}/messages/#{message_id}", default_headers, body
      end

      def delete_followup_message(interaction_token, message_id)
        @internet.delete "#{@base_url}/webhooks/#{@app_id}/#{interaction_token}/messages/#{message_id}"
      end
    end
  end
end