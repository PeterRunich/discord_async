# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Voice
      class State < StructBase
        attribute? :guild_id, Snowflake
        attribute :channel_id, Snowflake.optional
        attribute :user_id, Snowflake
        attribute? :member, Guild::Member
        attribute :session_id, Types::Coercible::String
        attribute :deaf, Types::Bool
        attribute :mute, Types::Bool
        attribute :self_deaf, Types::Bool
        attribute :self_mute, Types::Bool
        attribute? :self_stream, Types::Bool
        attribute :self_video, Types::Bool
        attribute :suppress, Types::Bool
        attribute :request_to_speak_timestamp, Types::TimestampISO8601.optional
      end
    end
  end
end
