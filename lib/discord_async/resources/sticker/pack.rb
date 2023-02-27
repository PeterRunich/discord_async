# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Sticker
      class Pack < StructBase
        attribute :id, Snowflake
        attribute :stickers, Types::Array.of(Sticker)
        attribute :name, Types::Coercible::String
        attribute :sku_id, Snowflake
        attribute :cover_sticker_id, Snowflake
        attribute :description, Types::Coercible::String
        attribute :banner_asset_id, Snowflake
      end
    end
  end
end
