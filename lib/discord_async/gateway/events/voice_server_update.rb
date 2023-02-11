# frozen_string_literal: true

require_relative 'base'
require_relative '../../types'
require_relative '../../resources/snowflake'

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
