require 'dry-struct'
require_relative '../../types'
require_relative '../snowflake'

module DiscordAsync
  module Resources
    class AuditLog < Dry::Struct
      class OptionalAuditEntry < Dry::Struct
        transform_keys(&:to_sym)

        attribute :application_id, Types::Snowflake
        attribute :auto_moderation_rule_name, Types::Coercible::String
        attribute :auto_moderation_rule_trigger_type, Types::Coercible::String
        attribute :channel_id, Types::Snowflake
        attribute :count, Types::Coercible::String
        attribute :delete_member_days, Types::Coercible::String
        attribute :id, Types::Snowflake
        attribute :members_removed, Types::Coercible::String
        attribute :message_id, Types::Snowflake
        attribute :role_name, Types::Coercible::String
        attribute :type, Types::Coercible::String
      end
    end
  end
end

