# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Channel
      class ThreadMetadata < StructBase
        attribute :archived, Types::Bool
        attribute :auto_archive_duration, Types::Coercible::Integer
        attribute :archive_timestamp, Types::TimestampISO8601
        attribute :locked, Types::Bool
        attribute? :invitable, Types::Bool
        attribute :create_timestamp, Types::TimestampISO8601.optional
      end
    end
  end
end
