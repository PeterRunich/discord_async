# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Application < StructBase
      class ApplicationCommand < StructBase
        ApplicationCommandTypes = Types::Integer.enum(1 => :chat_input, 2 => :user, 3 => :message)

        attribute :id, Types::Snowflake
        attribute? :type, ApplicationCommandTypes.default(1)
        attribute :application_id, Types::Snowflake
        attribute? :guild_id, Types::Snowflake
        attribute :name, Types::Coercible::String
        attribute? :name_localization, Types::Hash.optional
        attribute :description, Types::String.default('')
        attribute? :description_localization, Types::Hash.optional
        attribute? :options, Types::Array.of(Application::ApplicationCommandOption)
        attribute :default_member_permissions, Types::String.optional
        attribute? :dm_permission, Types::Bool.default(true)
        attribute? :nsfw, Types::Bool.default(false)
        attribute :version, Types::Snowflake
      end
    end
  end
end
