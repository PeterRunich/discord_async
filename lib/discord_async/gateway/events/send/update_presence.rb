# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      module Send
        class UpdatePresence < Base
          attribute :since, Types::Coercible::Integer.optional
          attribute :activities, Types::Array.of(Activity)
          attribute :status, Types::Coercible::String # TODO: Status Types
          attribute :afk, Types::Bool
        end
      end
    end
  end
end
