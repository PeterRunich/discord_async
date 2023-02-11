# frozen_string_literal: true

module DiscordAsync
  module REST
    module Oauth
      def get_current_bot_application_information
        @internet.get "#{@base_url}/oauth2/applications/@me"
      end

      def get_current_authorization_information
        @internet.get "#{@base_url}/oauth2/@me"
      end
    end
  end
end
