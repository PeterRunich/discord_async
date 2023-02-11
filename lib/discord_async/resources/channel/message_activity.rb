# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Channel < Dry::Struct
      class MessageActivity < Dry::Struct
        MessageActivityTypes = Types::Integer.enum(1 => :join, 2 => :spectate, 3 => :listen, 5 => :join_request)

        attribute :type, MessageActivityTypes
        attribute? :party_id, Types::Coercible::String
      end
    end
  end
end
