# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Interaction
      class ApplicationCommandData < StructBase
        attribute :id, Snowflake
        attribute :name, Types::Coercible::String
        attribute :type, Application::Command::CommandTypes
        attribute? :resolved, ResolvedData
        attribute? :options, Types::Array.of(ApplicationCommandInteractionDataOption)
        attribute? :guild_id, Snowflake
        attribute? :target_id, Snowflake
      end
    end
  end
end
