# frozen_string_literal: true

require_relative 'base'
require_relative '../../resources/guild/guild_member'
require_relative '../../types'

module DiscordAsync
  class Gateway
    module Events
      class GuildMemberAdd < Base
        attribute :guild_member, Resources::Guild::GuildMember
        attribute :guild_id, Types::Snowflake

        def initialize(attributes)
          attributes.transform_keys!(&:to_sym)

          super(guild_member: attributes.exclude(:guild_id), guild_id: attributes[:guild_id])
        end
      end
    end
  end
end
