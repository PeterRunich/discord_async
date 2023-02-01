require_relative 'base'
require_relative '../../resources/user/user'

module DiscordAsync
  class Gateway
    module Events
      class GuildBanAdd < Base
        transform_keys(&:to_sym)

        attribute :guild_id, Types::Snowflake
        attribute :user, Resources::User

        def initialize(attributes)
          attributes.transform_keys!(&:to_sym)

          super(user: attributes.exclude(:guild_id), guild_id: attributes[:guild_id])
        end
      end
    end
  end
end
