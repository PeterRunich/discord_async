# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Application
      module Command
        class GuildPermissions < StructBase
          attribute :id, Snowflake
          attribute :application_id, Snowflake
          attribute :guild_id, Snowflake
          attribute :permissions, Types::Array.of(Permissions)
        end
      end
    end
  end
end