# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Channel < StructBase
      class ForumTag < StructBase
        attribute :id, Types::Snowflake
        attribute :name, Types::Coercible::String
        attribute :moderated, Types::Bool
        attribute :emoji_id, Types::Snowflake.optional
        attribute :emoji_name, Types::Coercible::String.optional
      end
    end
  end
end
