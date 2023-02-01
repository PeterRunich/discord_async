require_relative 'base'
require_relative '../../types'
require_relative '../../resources/snowflake'
require_relative '../../resources/channel/message'
require_relative '../../resources/guild/guild_member'
require_relative '../../resources/user/user'


module DiscordAsync
  class Gateway
    module Events
      class MessageUpdate < Base
        attribute? :guild_id, Types::Snowflake
        attribute? :member, Resources::Guild::GuildMember
        attribute :mentions, Types::Array.of(Resources::User)
        attribute :message, Resources::Channel::Message

        def initialize(attributes)
          attributes.transform_keys!(&:to_sym)

          super(guild_id: attributes[:guild_id], member: attributes[:member], mentions: attributes[:mentions], message: attributes.exclude(:guild_id, :member, :mentions))
        end
      end
    end
  end
end
