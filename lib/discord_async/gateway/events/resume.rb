# frozen_string_literal: true

module DiscordAsync
  class Gateway
    module Events
      class Resume < Base
        attribute :token, Types::Coercible::String
        attribute :session_id, Types::Coercible::String
        attribute :seq, Types::Coercible::Integer
      end
    end
  end
end
