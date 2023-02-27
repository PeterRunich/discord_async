# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Webhook
      class Webhook < StructBase
        attribute :id, Snowflake
        attribute :type, WebhookTypes
        attribute? :guild_id, Snowflake.optional
        attribute :channel_id, Snowflake.optional
        attribute? :user, User::User
        attribute :name, Types::Coercible::String.optional
        attribute :avatar, Types::Coercible::String.optional
        attribute? :token, Types::Coercible::String
        attribute :application_id, Snowflake.optional
        attribute? :source_guild, Guild::PartialGuild
        attribute? :source_channel, Channel::Channel
        attribute? :url, Types::Coercible::String
      end
    end
  end
end
