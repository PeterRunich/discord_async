
module DiscordAsync
  module Resources
    class Channel < Dry::Struct
      class EmbedProvider < Dry::Struct
        attribute? :name, Types::Coercible::String
        attribute? :url, Types::Coercible::String
      end
    end
  end
end