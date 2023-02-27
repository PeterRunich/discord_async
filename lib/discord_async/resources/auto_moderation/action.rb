# frozen_string_literal: true

module DiscordAsync
  module Resources
    module AutoModeration
      class Action < StructBase
        ActionTypes = Types::Coercible::Integer.enum(1 => :block_message, 2 => :send_alert_message, 3 => :timeout)
        class ActionMetadata < StructBase
          attribute  :channel_id, Snowflake
          attribute  :duration_seconds, Types::Coercible::Integer
        end

        attribute :type, ActionTypes
        attribute? :metadata, ActionMetadata
      end
    end
  end
end
