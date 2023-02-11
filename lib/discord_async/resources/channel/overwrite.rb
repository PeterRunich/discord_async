# frozen_string_literal: true

require_relative '../../types'
require_relative '../../resources/snowflake'

module DiscordAsync
  module Resources
    class Channel < Dry::Struct
      class Overwrite < Dry::Struct
        attribute :id, Types::Snowflake
        attribute :type, Types::Coercible::Integer
        attribute :allow, Types::Coercible::String
        attribute :deny, Types::Coercible::String
      end
    end
  end
end
