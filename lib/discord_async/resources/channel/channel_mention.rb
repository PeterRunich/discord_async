# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Channel < Dry::Struct
      class ChannelMention < Dry::Struct
        attribute :id, Types::Snowflake
        attribute :guild_id, Types::Snowflake
        attribute :type, ChannelTypes
        attribute :name, Types::Coercible::String
      end
    end
  end
end
