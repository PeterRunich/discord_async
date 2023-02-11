# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Channel < Dry::Struct
      class EmbedField < Dry::Struct
        attribute :name, Types::Coercible::String
        attribute :value, Types::Coercible::String
        attribute :inline, Types::Bool
      end
    end
  end
end
