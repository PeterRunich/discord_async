require 'dry-struct'
require_relative '../../types'

module DiscordAsync
  module Resources
    class Channel < Dry::Struct
      class EmbedFooter < Dry::Struct
        attribute :text, Types::Coercible::String
        attribute? :icon_url, Types::Coercible::String
        attribute? :proxy_icon_url, Types::Coercible::String
      end
    end
  end
end