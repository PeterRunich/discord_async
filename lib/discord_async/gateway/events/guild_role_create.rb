# frozen_string_literal: true

require_relative 'base'
require_relative '../../resources/snowflake'
require_relative '../../resources/role'

module DiscordAsync
  class Gateway
    module Events
      class GuildRoleCreate < Base
        attribute :guild_id, Types::Snowflake
        attribute :role, Resources::Role
      end
    end
  end
end
