# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Guild
      class UnavailableGuild < StructBase
        attribute :id, Snowflake
        attribute? :unavailable, Types::Bool
      end
    end
  end
end
