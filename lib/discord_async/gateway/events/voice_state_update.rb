# frozen_string_literal: true

require_relative 'base'
require_relative '../../resources/voice/voice_state'

module DiscordAsync
  class Gateway
    module Events
      class VoiceStateUpdate < Base
        attribute :voice_state, Resources::Voice::VoiceState

        def initialize(attributes)
          super(voice_state: attributes)
        end
      end
    end
  end
end
