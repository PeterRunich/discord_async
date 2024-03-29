# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class ThreadMemberUpdate < Base
        attribute :thread_member, Resources::Channel::ThreadMember
        attribute :guild_id, Resources::Snowflake

        def self.new(attributes)
          attributes = attributes.transform_keys(&:to_sym)

          super(channel: attributes.except(:guild_id), guild_id: attributes[:guild_id])
        end
      end
    end
  end
end
