# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Channel
      class MessageReference < StructBase
        attribute? :message_id, Snowflake
        attribute? :channel_id, Snowflake
        attribute? :guild_id, Snowflake
        attribute? :fail_if_not_exists, Types::Bool
      end
    end
  end
end
