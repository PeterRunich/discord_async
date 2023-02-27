# frozen_string_literal: true

module DiscordAsync
  module Resources
    module User
      VisibilityTypes = Types::Coercible::Integer.enum(0 => :none, 1 => :everyone)

      class Connection < StructBase
        attribute :id, Types::Coercible::String
        attribute :name, Types::Coercible::String
        attribute :type, Types::Coercible::String
        attribute? :revoked, Types::Bool
        attribute? :integrations, Types::Array.of(Guild::Integration::Integration)
        attribute :verified, Types::Bool
        attribute :friend_sync, Types::Bool
        attribute :show_activity, Types::Bool
        attribute :two_way_link, Types::Bool
        attribute :visibility, VisibilityTypes
      end
    end
  end
end
