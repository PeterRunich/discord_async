# frozen_string_literal: true

module DiscordAsync
  class Gateway
    module Events
      class VoiceServerUpdate < Base
        attribute :token, Types::Coercible::String
        attribute :guild_id, Types::Snowflake
        attribute :endpoint, Types::Coercible::String.optional
      end
    end
  end
end
