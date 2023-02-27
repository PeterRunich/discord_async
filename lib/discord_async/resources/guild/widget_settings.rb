# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Guild
      class WidgetSettings < StructBase
        attribute :enabled, Types::Bool
        attribute :channel_id, Snowflake.optional
      end
    end
  end
end
