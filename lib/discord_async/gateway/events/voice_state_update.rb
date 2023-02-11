# frozen_string_literal: true

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
