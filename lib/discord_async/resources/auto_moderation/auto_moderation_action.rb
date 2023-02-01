require 'dry-struct'
require_relative '../../types'
require_relative '../snowflake'

module DiscordAsync
  module Resources
    module AutoModeration
      class AutoModerationAction < Dry::Struct
        ActionTypes = Types::Integer.enum(1 => :block_message, 2 => :send_alert_message, 3 => :timeout)
        class ActionMetadata < Dry::Struct
          attribute  :channel_id, Types::Snowflake
          attribute  :duration_seconds, Types::Coercible::Integer
        end

        transform_keys(&:to_sym)

        attribute :type, ActionTypes
        attribute? :metadata, ActionMetadata
      end
    end
  end
end