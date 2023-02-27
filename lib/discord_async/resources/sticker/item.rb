# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Sticker
      class Item < StructBase
        attribute :id, Snowflake
        attribute :name, Types::Coercible::String
        attribute :format_type, Formats
      end
    end
  end
end
