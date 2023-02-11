# frozen_string_literal: true

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
