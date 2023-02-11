# frozen_string_literal: true

module DiscordAsync
  class Gateway
    module Events
      class IdentifyConnectionProperties < Dry::Struct
        attribute :os, Types::Coercible::String
        attribute :browser, Types::Coercible::String
        attribute :device, Types::Coercible::String
      end

      class Identify < Base
        attribute :token, Types::Coercible::String
        attribute :properties, IdentifyConnectionProperties
        attribute? :compress, Types::Bool
        attribute? :large_threshold, Types::Coercible::Integer
        attribute? :shard, Types::Array.of(Types::Coercible::Integer)
        attribute? :presence, UpdatePresence
        attribute :intents, Types::Coercible::Integer
      end
    end
  end
end
