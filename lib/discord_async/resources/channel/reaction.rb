# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Channel
      class Reaction < StructBase
        attribute :count, Types::Coercible::Integer
        attribute :me, Types::Bool
        attribute :emoji, PartialEmoji
      end
    end
  end
end
