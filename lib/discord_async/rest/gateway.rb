# frozen_string_literal: true

module DiscordAsync
  module REST
    module Gateway
      def get_gateway
        @internet.get "#{@base_url}/gateway"
      end

      def get_gateway_bot
        @internet.get "#{@base_url}/gateway/bot"
      end
    end
  end
end
