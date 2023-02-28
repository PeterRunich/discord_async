# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      module Send
        class UpdateVoiceState < Base
          attribute :guild_id, Resources::Snowflake
          attribute :channel_id, Resources::Snowflake.optional
          attribute :self_mute, Types::Bool
          attribute :self_deaf, Types::Bool
        end
      end
    end
  end
end
