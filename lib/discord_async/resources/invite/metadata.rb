# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Invite
      class Metadata < StructBase
        attribute :uses, Types::Coercible::Integer
        attribute :max_uses, Types::Coercible::Integer
        attribute :max_age, Types::Coercible::Integer
        attribute :temporary, Types::Bool
        attribute :created_at, Types::TimestampISO8601
      end
    end
  end
end
