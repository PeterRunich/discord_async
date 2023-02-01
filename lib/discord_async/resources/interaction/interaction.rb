require 'dry-struct'
require_relative '../../types'
require_relative '../snowflake'
require_relative '../guild/guild_member'
require_relative '../user/user'
require_relative '../channel/message'

module DiscordAsync
  module Resources
    class Interaction < Dry::Struct
      InteractionType = Types::Integer.enum(1 => :ping, 2 => :application_command, 3 => :message_component, 4 =>:application_command_autocomplete, 5 => :modal_submit)

      attribute :id, Types::Snowflake
      attribute :application_id, Types::Snowflake
      attribute :type, InteractionType
      attribute :data,
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