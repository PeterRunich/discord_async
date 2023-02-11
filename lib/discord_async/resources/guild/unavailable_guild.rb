# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Guild < StructBase
      class UnavailableGuild < StructBase
        attribute :id, Types::Snowflake
        attribute? :unavailable, Types::Bool
      end
    end
  end
end
