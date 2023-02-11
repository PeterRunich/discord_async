# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Channel < StructBase
      class Reaction < StructBase
        attribute :count, Types::Coercible::Integer
        attribute :me, Types::Bool
        attribute :emoji, PartialEmoji
      end
    end
  end
end
