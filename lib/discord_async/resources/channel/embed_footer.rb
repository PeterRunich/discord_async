# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Channel
      class EmbedFooter < StructBase
        attribute :text, Types::Coercible::String
        attribute? :icon_url, Types::Coercible::String
        attribute? :proxy_icon_url, Types::Coercible::String
      end
    end
  end
end
