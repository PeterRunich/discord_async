# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Channel
      class DefaultReaction < StructBase
        attribute :emoji_id, Snowflake.optional
        attribute :emoji_name, Types::Coercible::String.optional
      end
    end
  end
end
