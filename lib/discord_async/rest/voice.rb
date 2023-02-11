# frozen_string_literal: true

module DiscordAsync
  module REST
    module Voice
      def list_voice_regions
        @internet.get "#{@base_url}/voice/regions"
      end
    end
  end
end
