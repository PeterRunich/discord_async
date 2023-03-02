# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class AutoModerationRuleUpdate < Base
        attribute :auto_moderation_rule, Resources::AutoModeration::Rule

        def self.new(attributes) = super(auto_moderation_rule: attributes)
      end
    end
  end
end
