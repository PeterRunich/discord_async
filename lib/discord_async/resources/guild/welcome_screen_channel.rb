# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Guild < StructBase
      class WelcomeScreenChannel < StructBase
        attribute :channel_id, Types::Snowflake
        attribute :description, Types::Coercible::String
        attribute :emoji_id, Types::Snowflake.optional
        attribute :emoji_name, Types::Coercible::String.optional
      end
    end
  end
end
