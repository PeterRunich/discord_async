# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Guild
      class Widget < StructBase
        attribute :id, Snowflake
        attribute :name, Types::Coercible::String
        attribute :instant_invite, Types::Coercible::String.optional
        attribute :channels, Types::Array.of(Channel::Channel)
        attribute :members, Types::Array.of(User::PartialUser)
        attribute :presence_count, Types::Coercible::Integer
      end
    end
  end
end
