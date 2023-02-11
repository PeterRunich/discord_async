# frozen_string_literal: true

module DiscordAsync
  module Resources
    class AuditLog < StructBase
      class AuditLogChange < StructBase
        attribute? :new_value, Types::Nominal::Any
        attribute? :old_value, Types::Nominal::Any
        attribute :key, Types::Coercible::String
      end
    end
  end
end
