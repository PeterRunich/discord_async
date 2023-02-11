# frozen_string_literal: true

require_relative 'base'
require_relative '../../resources/snowflake'

module DiscordAsync
  class Gateway
    module Events
      class GuildIntegrationsUpdate < Base
        attribute :guild_id, Types::Snowflake
      end
    end
  end
end
