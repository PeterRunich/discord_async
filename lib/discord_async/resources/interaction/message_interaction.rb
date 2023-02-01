require 'dry-struct'
require_relative '../../types'
require_relative '../user/user'
require_relative '../guild/guild_member'
require_relative 'interaction_types'

module DiscordAsync
  module Resources
    class Interaction < Dry::Struct
      class MessageInteraction < Dry::Struct
        attribute :id, Types::Snowflake
        attribute :type, InteractionTypes
        attribute :name, Types::Coercible::String
        attribute :user, User
        attribute? :member, Guild::PartialGuildMember
      end
    end
  end
end