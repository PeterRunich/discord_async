# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class GuildBanRemove < Base
        transform_keys(&:to_sym)

        attribute :guild_id, Resources::Snowflake
        attribute :user, Resources::User::User

        def self.new(attributes)
          attributes = attributes.transform_keys(&:to_sym)

          super(user: attributes.except(:guild_id), guild_id: attributes[:guild_id])
        end
      end
    end
  end
end
