# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Voice
      class VoiceObserver < EventObserver
        def initialize
          @subscribers = { 2 => [], 3 => [], 4 => [], 5 => [], 6 => [], 8 => [], 9 => [], 13 => [] }
        end
      end
    end
  end
end
