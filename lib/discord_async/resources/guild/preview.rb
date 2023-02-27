# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Guild
      class Preview < StructBase
        attribute :id, Snowflake
        attribute :name, Types::Coercible::String
        attribute :icon, Types::Coercible::String.optional
        attribute :splash, Types::Coercible::String.optional
        attribute :discovery_splash, Types::Coercible::String.optional
        attribute :emojis, Types::Array.of(Emoji)
        attribute :features, Types::Array.of(Types::Coercible::String) # TODO: maybe not string
        attribute :approximate_member_count, Types::Coercible::Integer
        attribute :approximate_presence_count, Types::Coercible::Integer
        attribute :description, Types::Coercible::String.optional
        attribute :stickers, Types::Array.of(Sticker::Sticker)
      end
    end
  end
end
