require_relative 'base'
require_relative '../../resources/stage_instance'

module DiscordAsync
  class Gateway
    module Events
      class InteractionCreate < Base
        attribute :interaction, Resources::Interaction
      end
    end
  end
end
