# frozen_string_literal: true

module DiscordAsync
  module ApplicationCommand
    module Util
      module DSLAttribute
        def dsl_attr(*attr_symbols)
          attr_symbols.each do |attr_symbol|
            define_method(attr_symbol) { |value| instance_variable_set :"@#{attr_symbol}", value }
          end
        end
      end
    end
  end
end
