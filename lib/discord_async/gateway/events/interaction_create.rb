# frozen_string_literal: true

module DiscordAsync
  class Gateway
    module Events
      class InteractionCreate < Base
        attribute :interaction, Resources::Interaction
      end
    end
  end
end
