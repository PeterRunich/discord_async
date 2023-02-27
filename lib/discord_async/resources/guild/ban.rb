# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Guild
      class Ban < StructBase
        attribute :reason, Types::Coercible::String.optional
        attribute :user, User::User
      end
    end
  end
end
