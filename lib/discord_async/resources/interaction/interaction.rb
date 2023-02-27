# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Interaction
      class Interaction < StructBase
        attribute :id, Snowflake
        attribute :application_id, Snowflake
        attribute :type, InteractionTypes
        attribute? :data, ApplicationCommandData | MessageComponentData | ModalSubmitData
        attribute? :guild_id, Snowflake
        attribute? :channel_id, Snowflake
        attribute? :member, Guild::Member
        attribute? :user, User::User
        attribute :token, Types::Coercible::String
        attribute :version, Types::Coercible::Integer
        attribute? :message, Channel::Message
        attribute? :app_permissions, Types::Coercible::String
        attribute? :locale, Types::Coercible::String
        attribute? :guild_locale, Types::Coercible::String
      end
    end
  end
end
