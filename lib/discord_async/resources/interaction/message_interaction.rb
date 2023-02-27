# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Interaction
      class MessageInteraction < StructBase
        attribute :id, Snowflake
        attribute :type, InteractionTypes
        attribute :name, Types::Coercible::String
        attribute :user, User::User
        attribute? :member, Guild::PartialMember
      end
    end
  end
end
