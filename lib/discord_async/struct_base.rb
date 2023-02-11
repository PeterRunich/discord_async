# frozen_string_literal: true

require 'dry-struct'

module DiscordAsync
  class StructBase < Dry::Struct
    transform_keys(&:to_sym)
  end
end
