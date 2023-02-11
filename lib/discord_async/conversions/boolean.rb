# frozen_string_literal: true

module DiscordAsync
  module Conversions
    module BooleanType
      FALSE_VALUES = [
        false, 0,
        '0', :"0",
        'f', :f,
        'F', :F,
        'false', false,
        'FALSE', :FALSE,
        'off', :off,
        'OFF', :OFF,
        ''
      ].to_set.freeze

      module_function

      def Boolean(value)
        !FALSE_VALUES.include? value
      end
    end
  end
end
