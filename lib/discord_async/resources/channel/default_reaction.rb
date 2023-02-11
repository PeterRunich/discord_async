# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Channel < StructBase
      class DefaultReaction < StructBase
        attribute :emoji_id, Types::Snowflake.optional
        attribute :emoji_name, Types::Coercible::String.optional
      end
    end
  end
end
