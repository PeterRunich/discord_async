# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Interaction < Dry::Struct
      attribute :id, Types::Snowflake
      attribute :application_id, Types::Snowflake
      attribute :type, InteractionTypes
      # attribute :data, TODO: complex check Discord doc
      attribute :guild_id, Types::Snowflake
      attribute :channel_id, Types::Snowflake
      attribute :member, Guild::GuildMember
      attribute :user, User
      attribute :token, Types::Coercible::String
      attribute :version, Types::Coercible::Integer
      attribute :message, Channel::Message
      attribute :app_permissions, Types::Coercible::String
      attribute :guild_locale, Types::Coercible::String
    end
  end
end
