# frozen_string_literal: true

require_relative '../../types'

module DiscordAsync
  module Resources
    class Channel < Dry::Struct
      class EmbedImage < Dry::Struct
        attribute :url, Types::Coercible::String
        attribute? :proxy_url, Types::Coercible::String
        attribute? :height, Types::Coercible::Integer
        attribute? :width, Types::Coercible::Integer
      end
    end
  end
end
