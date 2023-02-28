# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class MessageCreate < Base
        attribute? :guild_id, Resources::Snowflake
        attribute? :member, Resources::Guild::Member
        attribute :message, Resources::Channel::Message

        def self.new(attributes)
          attributes = attributes.transform_keys(&:to_sym)

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
