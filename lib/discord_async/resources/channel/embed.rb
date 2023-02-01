require 'dry-struct'
require_relative '../../types'
require_relative 'embed_footer'
require_relative 'embed_image'
require_relative 'embed_thumbnail'
require_relative 'embed_video'
require_relative 'embed_provider'
require_relative 'embed_author'
require_relative 'embed_field'

module DiscordAsync
  module Resources
    class Channel < Dry::Struct
      class Embed < Dry::Struct
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
        attribute :fields, Array.of(EmbedField)
      end
    end
  end
end