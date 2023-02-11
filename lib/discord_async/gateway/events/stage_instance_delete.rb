# frozen_string_literal: true

module DiscordAsync
  class Gateway
    module Events
      class StageInstanceDelete < Base
        attribute :stage_instance, Resources::StageInstance
      end
    end
  end
end
