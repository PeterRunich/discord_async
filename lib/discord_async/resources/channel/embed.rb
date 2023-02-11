# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Channel < StructBase
      class Embed < StructBase
        attribute :title, Types::Coercible::String
        attribute :type, Types::Coercible::Symbol
        attribute :description, Types::Coercible::String
        attribute :url, Types::Coercible::String
        attribute :timestamp, Types::TimestampISO8601
        attribute :color, Types::Coercible::Integer
        attribute :footer, EmbedFooter
        attribute :image, EmbedImage
        attribute :thumbnail, EmbedThumbnail
        attribute :video, EmbedVideo
        attribute :provider, EmbedProvider
        attribute :author, EmbedAuthor
        attribute :fields, Types::Array.of(EmbedField)
      end
    end
  end
end
