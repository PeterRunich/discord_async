# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class GuildMemberAdd < Base
        attribute :guild_member, Resources::Guild::Member
        attribute :guild_id, Resources::Snowflake

        def initialize(attributes)
          attributes = attributes.transform_keys(&:to_sym)

          super(guild_member: attributes.exclude(:guild_id), guild_id: attributes[:guild_id])
        end
      end
    end
  end
end
