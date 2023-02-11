# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Sticker < StructBase
      class StickerItem < StructBase
        attribute :id, Types::Snowflake
        attribute :name, Types::Coercible::String
        attribute :format_type, StickerFormat
      end
    end
  end
end
