require_relative 'base'
require_relative '../../resources/snowflake'
require_relative '../../resources/channel/thread_member'

module DiscordAsync
  class Gateway
    module Events
      class ThreadMemberUpdate < Base
        attribute :thread_member, Resources::Channel::ThreadMember
        attribute :guild_id, Types::Snowflake

        def initialize(attributes)
          attributes.transform_keys!(&:to_sym)

          super(channel: attributes.exclude(:guild_id), guild_id: attributes[:guild_id])
        end
      end
    end
  end
end
