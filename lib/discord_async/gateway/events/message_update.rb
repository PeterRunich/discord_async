# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class MessageUpdate < Base
        attribute? :guild_id, Resources::Snowflake
        attribute? :member, Resources::Guild::Member
        attribute :message, Resources::Channel::PartialMessage

        def self.new(attributes)
          attributes = attributes.transform_keys(&:to_sym)

          attributes = {
            guild_id: attributes[:guild_id],
            member: attributes[:member],
            message: attributes.except(:guild_id, :member)
          }.compact

          super
        end
      end
    end
  end
end
