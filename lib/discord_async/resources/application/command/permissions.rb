# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Application
      module Command
        class Permissions < StructBase
          attribute :id, Snowflake
          attribute :type, PermissionTypes
          attribute :permissions, Types::Bool
        end
      end
    end
  end
end
