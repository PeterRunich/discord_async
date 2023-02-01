require 'dry-struct'
require_relative '../../types'
require_relative '../snowflake'
require_relative 'channel'
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