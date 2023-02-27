# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Guild
      module Integration
        class Application < StructBase
          attribute :id, Snowflake
          attribute :name, Types::Coercible::String
          attribute :icon, Types::Coercible::String.optional
          attribute :description, Types::Coercible::String
          attribute? :bot, User::User
        end
      end
    end
  end
end
