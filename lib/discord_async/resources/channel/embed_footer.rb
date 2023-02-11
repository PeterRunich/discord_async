# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Channel < StructBase
      class EmbedFooter < StructBase
        attribute :text, Types::Coercible::String
        attribute? :icon_url, Types::Coercible::String
        attribute? :proxy_icon_url, Types::Coercible::String
      end
    end
  end
end
