# frozen_string_literal: true

module DiscordAsync
  class Gateway
    module Events
      class AutoModerationRuleCreate < Base
        attribute :auto_moderation_rule, Resources::AutoModeration::AutoModerationRule

        def initialize(attributes)
          super(auto_moderation_rule: attributes)
        end
      end
    end
  end
end
