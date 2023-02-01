require 'dry-struct'
require_relative '../../types'
require_relative '../snowflake'

module DiscordAsync
  module Resources
    class Guild < Dry::Struct
      class WelcomeScreenChannel < Dry::Struct
        transform_keys(&:to_sym)

        attribute :channel_id, Types::Snowflake
        attribute :description, Types::Coercible::String
        attribute :emoji_id, Types::Snowflake.optional
        attribute :emoji_name, Types::Coercible::String.optional
      end
    end
  end
end