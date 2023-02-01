require 'dry-struct'
require_relative '../../../types'
require_relative '../../snowflake'
require_relative '../../user/user'
require_relative '../../application/application'
require_relative 'integration_account'

module DiscordAsync
  module Resources
    class Guild < Dry::Struct
      class Integration < Dry::Struct
        IntegrationExpireBehaviors = Types::Integer.enum(0 => :remove_role, 1 => :kick)

        transform_keys(&:to_sym)

        attribute :id, Types::Snowflake
        attribute :name, Types::Coercible::String
        attribute :type, Types::Coercible::String
        attribute :enabled, Types::Bool
        attribute? :syncing, Types::Bool
        attribute? :role_id, Types::Snowflake
        attribute? :enable_emoticons, Types::Bool
        attribute? :expire_behavior, IntegrationExpireBehaviors
        attribute? :expire_grace_period, Types::Coercible::Integer
        attribute? :user, User
        attribute :account, IntegrationAccount
        attribute? :synced_at, Types::TimestampISO8601
        attribute? :subscriber_count, Types::Coercible::Integer
        attribute? :revoked, Types::Bool
        attribute? :application, Application
        attribute? :scopes, Types::Array.of(Types::Coercible::String)
      end

      class PartialIntegration < Dry::Struct
        IntegrationExpireBehaviors = Types::Integer.enum(0 => :remove_role, 1 => :kick)

        transform_keys(&:to_sym)

        attribute :id, Types::Snowflake
        attribute? :name, Types::Coercible::String
        attribute? :type, Types::Coercible::String
        attribute? :enabled, Types::Bool
        attribute? :syncing, Types::Bool
        attribute? :role_id, Types::Snowflake
        attribute? :enable_emoticons, Types::Bool
        attribute? :expire_behavior, IntegrationExpireBehaviors
        attribute? :expire_grace_period, Types::Coercible::Integer
        attribute? :user, User
        attribute? :account, IntegrationAccount
        attribute? :synced_at, Types::TimestampISO8601
        attribute? :subscriber_count, Types::Coercible::Integer
        attribute? :revoked, Types::Bool
        attribute? :application, Application
        attribute? :scopes, Types::Array.of(Types::Coercible::String)
      end
    end
  end
end