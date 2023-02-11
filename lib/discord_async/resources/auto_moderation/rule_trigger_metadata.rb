# frozen_string_literal: true

module DiscordAsync
  module Resources
    module AutoModeration
      class RuleTriggerMetadata < StructBase
        KeywordPresetTypes = Types::Integer.enum(1 => :profanity, 2 => :sexual_content, 3 => :slurs)

        attribute :keyword_filter, Types::Array.of(Types::Coercible::String)
        attribute :regex_patterns, Types::Array.of(Types::Coercible::String)
        attribute :presets, Types::Array.of(KeywordPresetTypes)
        attribute :allow_list, Types::Array.of(Types::Coercible::String)
        attribute :mention_total_limit, Types::Coercible::Integer
      end
    end
  end
end
