# frozen_string_literal: true

module DiscordAsync
  module Resources
    module AuditLog
      class Entry < StructBase
        attribute :target_id, Types::Coercible::String
        attribute? :changes, Types::Array.of(Change)
        attribute :user_id, Snowflake.optional
        attribute :id, Snowflake
        attribute :action_type, EventTypes
        attribute? :options, OptionalAuditEntryInfo
        attribute? :reason, Types::Coercible::String
      end
    end
  end
end
