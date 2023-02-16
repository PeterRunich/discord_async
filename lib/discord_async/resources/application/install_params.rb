# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Application
      class InstallParams < StructBase
        attribute :scopes, Types::Array.of(Types::Coercible::String)
        attribute :permissions, Types::Coercible::String
      end
    end
  end
end
