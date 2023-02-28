# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Guild
      module Integration
        class Integration < StructBase
          attribute :id, Snowflake
          attribute :name, Types::Coercible::String
          attribute :type, Types::Coercible::String
          attribute :enabled, Types::Bool
          attribute? :syncing, Types::Bool
          attribute? :role_id, Snowflake
          attribute? :enable_emoticons, Types::Bool
          attribute? :expire_behavior, ExpireBehaviorTypes
          attribute? :expire_grace_period, Types::Coercible::Integer
          attribute? :user, User::User
          attribute :account, Account
          attribute? :synced_at, Types::TimestampISO8601
          attribute? :subscriber_count, Types::Coercible::Integer
          attribute? :revoked, Types::Bool
          attribute? :application, Application
          attribute? :scopes, Types::Array.of(Types::Coercible::String)
        end
      end
    end
  end
end
