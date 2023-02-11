# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Sticker < Dry::Struct
      class StickerItem < Dry::Struct
        transform_keys(&:to_sym)

        attribute :id, Types::Snowflake
        attribute :name, Types::Coercible::String
        attribute :format_type, StickerFormat
      end
    end
  end
end
