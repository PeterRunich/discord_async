# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Channel < StructBase
      class EmbedField < StructBase
        attribute :name, Types::Coercible::String
        attribute :value, Types::Coercible::String
        attribute :inline, Types::Bool
      end
    end
  end
end
