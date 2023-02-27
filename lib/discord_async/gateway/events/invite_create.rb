# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class InviteCreate < Base
        attribute :channel_id, Resources::Snowflake
        attribute :code, Types::Coercible::String
        attribute :created_at, Types::TimestampISO8601
        attribute? :guild_id, Resources::Snowflake
        attribute? :inviter, Resources::User::User
        attribute :max_age, Types::Coercible::Integer
        attribute :max_uses, Types::Coercible::Integer
        attribute? :target_type, Types::Coercible::Integer
        attribute? :target_user, Resources::User::User
        attribute? :target_application, Resources::Application::PartialApplication
        attribute :temporary, Types::Bool
        attribute :uses, Types::Coercible::Integer
      end
    end
  end
end
