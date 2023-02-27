# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Guild
      class WelcomeScreenChannel < StructBase
        attribute :channel_id, Snowflake
        attribute :description, Types::Coercible::String
        attribute :emoji_id, Snowflake.optional
        attribute :emoji_name, Types::Coercible::String.optional
      end
    end
  end
end
