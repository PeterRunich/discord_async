# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Channel < Dry::Struct
      class EmbedThumbnail < Dry::Struct
        attribute :url, Types::Coercible::String
        attribute? :proxy_url, Types::Coercible::String
        attribute? :height, Types::Coercible::Integer
        attribute? :width, Types::Coercible::Integer
      end
    end
  end
end
