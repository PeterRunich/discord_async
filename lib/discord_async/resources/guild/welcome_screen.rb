# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Guild
      class WelcomeScreen < StructBase
        attribute :description, Types::Coercible::String.optional
        attribute :welcome_channels, Types::Array.of(WelcomeScreenChannel)
      end
    end
  end
end
