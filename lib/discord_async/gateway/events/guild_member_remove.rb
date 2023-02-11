# frozen_string_literal: true

require_relative 'base'
require_relative '../../types'
require_relative '../../resources/user/user'

module DiscordAsync
  class Gateway
    module Events
      class GuildMemberRemove < Base
        attribute :guild_id, Types::Snowflake
        attribute :user, Resources::User
      end
    end
  end
end
