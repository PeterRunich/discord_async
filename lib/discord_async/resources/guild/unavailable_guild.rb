# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Guild < Dry::Struct
      class UnavailableGuild < Dry::Struct
        transform_keys(&:to_sym)

        attribute :id, Types::Snowflake
        attribute? :unavailable, Types::Bool
      end
    end
  end
end
