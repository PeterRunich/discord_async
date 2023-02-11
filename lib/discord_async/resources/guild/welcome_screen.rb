# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Guild < Dry::Struct
      class WelcomeScreen < Dry::Struct
        transform_keys(&:to_sym)

        attribute :description, Types::Coercible::String.optional
        attribute :welcome_channels, Types::Array.of(WelcomeScreenChannel)
      end
    end
  end
end
