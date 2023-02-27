# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class StageInstanceCreate < Base
        attribute :stage_instance, Resources::StageInstance
      end
    end
  end
end
