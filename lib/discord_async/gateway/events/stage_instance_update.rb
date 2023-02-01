require_relative 'base'
require_relative '../../resources/stage_instance'

module DiscordAsync
  class Gateway
    module Events
      class StageInstanceUpdate < Base
        attribute :stage_instance, Resources::StageInstance
      end
    end
  end
end
