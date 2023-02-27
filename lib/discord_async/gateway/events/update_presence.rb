# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class UpdatePresence < Base
        attribute :since, Types::Coercible::Integer.optional
        attribute :activities, Types::Array.of(Activity)
        attribute :status, Types::Coercible::String
        attribute :afk, Types::Bool
      end
    end
  end
end
