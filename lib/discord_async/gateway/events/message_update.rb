# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class MessageUpdate < Base
        attribute? :guild_id, Resources::Snowflake
        attribute? :member, Resources::Guild::Member
        attribute :mentions, Types::Array.of(Resources::User::User)
        attribute :message, Resources::Channel::Message

        def initialize(attributes)
          attributes.transform_keys!(&:to_sym)

          super(guild_id: attributes[:guild_id], member: attributes[:member], mentions: attributes[:mentions], message: attributes.exclude(
            :guild_id, :member, :mentions
          ))
        end
      end
    end
  end
end
