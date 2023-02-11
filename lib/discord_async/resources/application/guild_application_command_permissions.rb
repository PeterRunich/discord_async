# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Application < StructBase
      class GuildApplicationCommandPermissions < StructBase
        attribute :id, Types::Snowflake
        attribute :application_id, Types::Snowflake
        attribute :guild_id, Types::Snowflake
        attribute :permissions, Types::Array.of(Application::ApplicationCommandPermissions)
      end
    end
  end
end
