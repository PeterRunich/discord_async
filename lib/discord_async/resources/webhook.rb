# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Webhook < StructBase
      WebhookTypes = Types::Integer.enum(1 => :incoming, 2 => :channel_follower, 3 => :application)

      attribute :id, Types::Snowflake
      attribute :type, WebhookTypes
      attribute? :guild_id, Types::Snowflake.optional
      attribute :channel_id, Types::Snowflake.optional
      attribute? :user, User
      attribute :name, Types::Coercible::String.optional
      attribute :avatar, Types::Coercible::String.optional
      attribute? :token, Types::Coercible::String
      attribute :application_id, Types::Snowflake.optional
      attribute? :source_guild, PartialGuild
      attribute? :source_channel, Channel
      attribute? :url, Types::Coercible::String
    end
  end
end
