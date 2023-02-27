# frozen_string_literal: true

module DiscordAsync
  module Resources
    module AutoModeration
      RuleTriggerTypes = Types::Coercible::Integer.enum(
        1 => :keyword,
        3 => :spam,
        4 => :keyword_preset,
        5 => :mention_spam
      )
    end
  end
end
