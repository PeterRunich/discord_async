# frozen_string_literal: true

require_relative '../../types'
require_relative '../snowflake'

module DiscordAsync
  module Resources
    class Channel < Dry::Struct
      class ForumTag < Dry::Struct
        attribute :id, Types::Snowflake
        attribute :name, Types::Coercible::String
        attribute :moderated, Types::Bool
        attribute :emoji_id, Types::Snowflake.optional
        attribute :emoji_name, Types::Coercible::String.optional
      end
    end
  end
end
