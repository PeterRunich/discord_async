# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Channel
      class Overwrite < StructBase
        attribute :id, Snowflake
        attribute :type, Types::Coercible::Integer
        attribute :allow, Types::Coercible::String
        attribute :deny, Types::Coercible::String
      end
    end
  end
end
