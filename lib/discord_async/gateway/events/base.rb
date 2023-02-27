# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class Base < StructBase
        def self.event_name
          name.split('::').last
              .gsub(/::/, '/')
              .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
              .gsub(/([a-z\d])([A-Z])/, '\1_\2')
              .tr('-', '_')
              .upcase
        end
      end
    end
  end
end
