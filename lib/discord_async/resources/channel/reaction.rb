require 'dry-struct'
require_relative '../../types'
require_relative '../emoji'

module DiscordAsync
  module Resources
    class Channel < Dry::Struct
      class Reaction < Dry::Struct
        attribute :count, Types::Coercible::Integer
        attribute :me, Types::Bool
        attribute :emoji, PartialEmoji
      end
    end
  end
end