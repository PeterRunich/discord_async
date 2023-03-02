# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class VoiceStateUpdate < Base
        attribute :voice_state, Resources::Voice::State

        def self.new(attributes) = super(voice_state: attributes)
      end
    end
  end
end
