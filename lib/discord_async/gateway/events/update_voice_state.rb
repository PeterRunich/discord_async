# frozen_string_literal: true

module DiscordAsync
  class Gateway
    module Events
      class UpdateVoiceState < Base
        attribute :guild_id, Types::Snowflake
        attribute :channel_id, Types::Snowflake.optional
        attribute :self_mute, Types::Bool
        attribute :self_deaf, Types::Bool
      end
    end
  end
end
