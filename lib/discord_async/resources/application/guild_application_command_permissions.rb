require 'dry-struct'
require_relative '../../types'
require_relative '../snowflake'
require_relative 'application_command_permissions'

module DiscordAsync
  module Resources
    class Application
      class GuildApplicationCommandPermissions < Dry::Struct
        transform_keys(&:to_sym)

        attribute :id, Types::Snowflake
        attribute :application_id, Types::Snowflake
        attribute :guild_id, Types::Snowflake
        attribute :permissions, Types::Array.of(Application::ApplicationCommandPermissions)
      end
    end
  end
end

