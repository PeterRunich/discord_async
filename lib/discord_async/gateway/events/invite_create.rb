# frozen_string_literal: true

require_relative 'base'
require_relative '../../types'
require_relative '../../resources/snowflake'
require_relative '../../resources/user/user'
require_relative '../../resources/application/application'

module DiscordAsync
  class Gateway
    module Events
      class InviteCreate < Base
        attribute :channel_id, Types::Snowflake
        attribute :code, Types::Coercible::String
        attribute :created_at, Types::TimestampISO8601
        attribute? :guild_id, Types::Snowflake
        attribute? :inviter, Resources::User
        attribute :max_age, Types::Coercible::Integer
        attribute :max_uses, Types::Coercible::Integer
        attribute? :target_type, Types::Coercible::Integer
        attribute? :target_user, Resources::User
        attribute? :target_application, Resources::PartialApplication
        attribute :temporary, Types::Bool
        attribute :uses, Types::Coercible::Integer
      end
    end
  end
end
