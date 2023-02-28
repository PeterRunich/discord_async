# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      module Send
        class Resume < Base
          attribute :token, Types::Coercible::String
          attribute :session_id, Types::Coercible::String
          attribute :seq, Types::Coercible::Integer
        end
      end
    end
  end
end
