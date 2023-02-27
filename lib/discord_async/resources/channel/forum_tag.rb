# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Channel
      class ForumTag < StructBase
        attribute :id, Snowflake
        attribute :name, Types::Coercible::String
        attribute :moderated, Types::Bool
        attribute :emoji_id, Snowflake.optional
        attribute :emoji_name, Types::Coercible::String.optional
      end
    end
  end
end
