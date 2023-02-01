require 'dry-struct'
require_relative '../../types'

module DiscordAsync
  module Resources
    class Channel < Dry::Struct
      class ThreadMetadata < Dry::Struct
        transform_keys(&:to_sym)

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