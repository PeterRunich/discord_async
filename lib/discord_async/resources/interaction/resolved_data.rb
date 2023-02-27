# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Interaction
      class ResolvedData < StructBase
        attribute? :users, Types::Hash.map(Snowflake, User::User)
        attribute? :members, Types::Hash.map(Snowflake, Guild::PartialMember)
        attribute? :roles, Types::Hash.map(Snowflake, Role)
        attribute? :channels, Types::Hash.map(Snowflake, Channel::Channel) # Partial channel
        attribute? :messages, Types::Hash.map(Snowflake, Channel::PartialMessage)
        attribute? :attachments, Types::Hash.map(Snowflake, Channel::Attachment)
      end
    end
  end
end
