# frozen_string_literal: true

module DiscordAsync
  module Resources
    class ApplicationRoleConnectionMetadata < StructBase
      attribute :type, ApplicationRoleConnectionMetadataTypes
      attribute :key, Types::Coercible::String
      attribute :name, Types::Coercible::String
      attribute? :name_localizations, Types::Hash
      attribute :description, Types::Coercible::String
      attribute? :description_localizations, Types::Hash
    end
  end
end
