# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      module Send
        class Identify < Base
          attribute :token, Types::Coercible::String
          attribute :properties do
            attribute :os, Types::Coercible::String
            attribute :browser, Types::Coercible::String
            attribute :device, Types::Coercible::String
          end
          attribute? :compress, Types::Bool.default(false)
          attribute? :large_threshold, Types::Coercible::Integer.default(50)
          attribute? :shard, Types::Array.of(Types::Coercible::Integer)
          attribute? :presence, UpdatePresence
          attribute :intents, Types::Coercible::Integer
        end
      end
    end
  end
end
