# frozen_string_literal: true

require_relative '../../types'
require_relative '../../resources/snowflake'
require_relative '../../resources/guild/guild_member'

module DiscordAsync
  module Resources
    module Voice
      class VoiceState < Dry::Struct
        attribute? :guild_id, Types::Snowflake
        attribute :channel_id, Types::Snowflake.optional
        attribute :user_id, Types::Snowflake
        attribute? :member, Resources::Guild::GuildMember
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
