# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Application < Dry::Struct
      transform_keys(&:to_sym)

      attribute :id, Types::Snowflake
      attribute :name, Types::Coercible::String
      attribute :icon, Types::Coercible::String.optional
      attribute :description, Types::Coercible::String
      attribute? :rpc_origins, Types::Array.of(Types::Coercible::String)
      attribute :bot_public, Types::Bool
      attribute :bot_require_code_grant, Types::Bool
      attribute? :terms_of_service_url, Types::Coercible::String
      attribute? :privacy_policy_url, Types::Coercible::String
      attribute? :owner, Types::Hash
      attribute :verify_key, Types::Coercible::String
      attribute :team, Types::Hash.optional
      attribute? :guild_id, Types::Snowflake
      attribute? :primary_sku_id, Types::Snowflake
      attribute? :slug, Types::Coercible::String
      attribute? :cover_image, Types::Coercible::String
      attribute? :flags, Types::Coercible::Integer
      attribute? :tags, Types::Array.of(Types::Coercible::String)
      attribute? :install_params, Types::Hash
      attribute? :custom_install_url, Types::Coercible::String
      attribute? :role_connections_verification_url, Types::Coercible::String
    end

    class PartialApplication < Dry::Struct
      transform_keys(&:to_sym)

      attribute :id, Types::Snowflake
      attribute? :name, Types::Coercible::String
      attribute? :icon, Types::Coercible::String.optional
      attribute? :description, Types::Coercible::String
      attribute? :rpc_origins, Types::Array.of(Types::Coercible::String)
      attribute? :bot_public, Types::Bool
      attribute? :bot_require_code_grant, Types::Bool
      attribute? :terms_of_service_url, Types::Coercible::String
      attribute? :privacy_policy_url, Types::Coercible::String
      attribute? :owner, Types::Hash
      attribute? :verify_key, Types::Coercible::String
      attribute? :team, Types::Hash.optional
      attribute? :guild_id, Types::Snowflake
      attribute? :primary_sku_id, Types::Snowflake
      attribute? :slug, Types::Coercible::String
      attribute? :cover_image, Types::Coercible::String
      attribute? :flags, Types::Coercible::Integer
      attribute? :tags, Types::Array.of(Types::Coercible::String)
      attribute? :install_params, Types::Hash
      attribute? :custom_install_url, Types::Coercible::String
      attribute? :role_connections_verification_url, Types::Coercible::String
    end
  end
end
