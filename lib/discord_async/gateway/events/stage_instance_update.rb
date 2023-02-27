# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class StageInstanceUpdate < Base
        attribute :stage_instance, Resources::StageInstance
      end
    end
  end
end
