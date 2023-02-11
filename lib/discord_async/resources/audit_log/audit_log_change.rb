# frozen_string_literal: true

module DiscordAsync
  module Resources
    class AuditLog < Dry::Struct
      class AuditLogChange < Dry::Struct
        transform_keys(&:to_sym)

        attribute? :new_value, Types::Nominal::Any
        attribute? :old_value, Types::Nominal::Any
        attribute :key, Types::Coercible::String
      end
    end
  end
end
