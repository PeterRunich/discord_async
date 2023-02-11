# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Interaction < StructBase
      class MessageInteraction < StructBase
        attribute :id, Types::Snowflake
        attribute :type, InteractionTypes
        attribute :name, Types::Coercible::String
        attribute :user, User
        attribute? :member, Guild::PartialGuildMember
      end
    end
  end
end
