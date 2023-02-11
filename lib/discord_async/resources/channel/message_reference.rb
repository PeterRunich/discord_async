# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Channel < StructBase
      class MessageReference < StructBase
        attribute? :message_id, Types::Snowflake
        attribute? :channel_id, Types::Snowflake
        attribute? :guild_id, Types::Snowflake
        attribute? :fail_if_not_exists, Types::Bool
      end
    end
  end
end
