require_relative 'base'
require_relative '../../types'
require_relative '../../resources/snowflake'
require_relative '../../resources/channel/message'
require_relative '../../resources/guild/guild_member'
require_relative '../../resources/user/user'
module DiscordAsync
  class Gateway
    module Events
      class MessageCreate < Base
        attribute? :guild_id, Types::Snowflake
        attribute? :member, Resources::Guild::GuildMember
        attribute :message, Resources::Channel::Message

        def self.new(attributes)
          attributes.transform_keys!(&:to_sym)

          super(
            guild_id: attributes[:guild_id],
            member: attributes[:member],
            message: attributes.except(:guild_id, :member)
          )
        end
      end
    end
  end
end
