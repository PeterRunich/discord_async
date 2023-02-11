# frozen_string_literal: true

module DiscordAsync
  module REST
    module StageInstance
      def create_stage_instance(body)
        @internet.post "#{@base_url}/stage-instances", default_headers, body
      end

      def get_stage_instance(channel_id)
        @internet.get "#{@base_url}/stage-instances/#{channel_id}"
      end

      def modify_stage_instance(channel_id, body)
        @internet.patch "#{@base_url}/stage-instances/#{channel_id}", default_headers, body
      end

      def delete_stage_instance(channel_id)
        @internet.delete "#{@base_url}/stage-instances/#{channel_id}"
      end
    end
  end
end
