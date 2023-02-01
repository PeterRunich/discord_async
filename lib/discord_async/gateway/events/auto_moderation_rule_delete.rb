require 'dry-struct'
require_relative 'base'
require_relative '../../resources/auto_moderation/auto_moderation_rule'


module DiscordAsync
  class Gateway
    module Events
      class AutoModerationRuleDelete < Base
        attribute :auto_moderation_rule, Resources::AutoModeration::AutoModerationRule

        def initialize(attributes)
          super(auto_moderation_rule: attributes)
        end
      end
    end
  end
end
