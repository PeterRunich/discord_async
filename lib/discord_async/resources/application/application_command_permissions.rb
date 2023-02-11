# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Application < StructBase
      class ApplicationCommandPermissions < StructBase
        attribute :id, Types::Snowflake
        attribute :type, Types::Coercible::Integer
        attribute :permissions, Types::Bool
      end
    end
  end
end
