# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Channel
      class EmbedProvider < StructBase
        attribute? :name, Types::Coercible::String
        attribute? :url, Types::Coercible::String
      end
    end
  end
end
