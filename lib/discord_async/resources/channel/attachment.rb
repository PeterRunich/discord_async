# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Channel < Dry::Struct
      class Attachment < Dry::Struct
        attribute :id, Types::Snowflake
        attribute :filename, Types::Coercible::String
        attribute? :description, Types::Coercible::String
        attribute? :content_type, Types::Coercible::String
        attribute :size, Types::Coercible::Integer
        attribute :url, Types::Coercible::String
        attribute :proxy_url, Types::Coercible::String
        attribute? :height, Types::Coercible::Integer.optional
        attribute? :width, Types::Coercible::Integer.optional
        attribute? :ephemeral, Types::Bool
      end
    end
  end
end
