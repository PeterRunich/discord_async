# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Channel < StructBase
      class Overwrite < StructBase
        attribute :id, Types::Snowflake
        attribute :type, Types::Coercible::Integer
        attribute :allow, Types::Coercible::String
        attribute :deny, Types::Coercible::String
      end
    end
  end
end
