# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Channel
      class ChannelMention < StructBase
        attribute :id, Snowflake
        attribute :guild_id, Snowflake
        attribute :type, ChannelTypes
        attribute :name, Types::Coercible::String
      end
    end
  end
end
