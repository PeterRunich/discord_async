# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Channel
      class EmbedAuthor < StructBase
        attribute :name, Types::Coercible::String
        attribute? :url, Types::Coercible::String
        attribute? :icon_url, Types::Coercible::String
        attribute? :proxy_icon_url, Types::Coercible::String
      end
    end
  end
end
