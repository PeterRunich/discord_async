# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class InteractionCreate < Base
        attribute :interaction, Resources::Interaction::Interaction

        def self.new(attributes) = super(interaction: attributes)
      end
    end
  end
end
