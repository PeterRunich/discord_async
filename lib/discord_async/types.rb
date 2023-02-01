# frozen_string_literal: true

require 'dry-types'

module DiscordAsync
  module Types
    include Dry.Types()

    TimestampISO8601 = Types.Constructor(DateTime) { DateTime.iso8601(_1) }
  end
end
