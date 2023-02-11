# frozen_string_literal: true

require_relative '../../types'
require_relative '../snowflake'
require_relative '../application/application_command'
require_relative '../application/resolved_data'
require_relative 'application_command_interaction_data_option'

module DiscordAsync
  module Resources
    class Interaction < Dry::Struct
      class ApplicationCommandData < Dry::Struct
        attribute :id, Types::Snowflake
        attribute :name, Types::Coercible::String
        attribute :type, ApplicationCommand::ApplicationCommandTypes
        attribute? :resolved, ResolvedData
        attribute? :options, Types::Array.of(ApplicationCommandInteractionDataOption)
        attribute? :guild_id, Types::Snowflake
        attribute? :target_id, Types::Snowflake
      end
    end
  end
end
