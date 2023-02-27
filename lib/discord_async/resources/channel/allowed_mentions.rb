# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Channel
      AllowedMentionTypes = Types::Coercible::String.enum('roles', 'users', 'everyone')
      class AllowedMentions < StructBase
        attribute :parse, AllowedMentionTypes
        attribute :roles, Types::Array.of(Snowflake)
        attribute :users, Types::Array.of(Snowflake)
        attribute :replied_user, Types::Bool
      end
    end
  end
end
