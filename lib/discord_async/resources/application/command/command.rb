# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Application
      module Command
        class Command
          attribute :id, Snowflake
          attribute? :type, Types::Integer.default(1).enum(*CommandTypes.values)
          attribute :application_id, Snowflake
          attribute? :guild_id, Snowflake
          attribute :name, Types::Coercible::String
          attribute? :name_localization, Types::Hash.optional
          attribute :description, Types::Coercible::String
          attribute? :description_localization, Types::Hash.optional
          attribute? :options, Types::Array.of(Option)
          attribute :default_member_permissions, Types::Coercible::String.optional
          attribute? :dm_permission, Types::Bool
          attribute? :nsfw, Types::Bool.default(false)
          attribute :version, Snowflake
        end
      end
    end
  end
end
