# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Guild < StructBase
      class Integration < StructBase
        IntegrationExpireBehaviors = Types::Integer.enum(0 => :remove_role, 1 => :kick)

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

      class PartialIntegration < StructBase
        IntegrationExpireBehaviors = Types::Integer.enum(0 => :remove_role, 1 => :kick)

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
        attribute? :account, Integration::IntegrationAccount
        attribute? :synced_at, Types::TimestampISO8601
        attribute? :subscriber_count, Types::Coercible::Integer
        attribute? :revoked, Types::Bool
        attribute? :application, Application
        attribute? :scopes, Types::Array.of(Types::Coercible::String)
      end
    end
  end
end
