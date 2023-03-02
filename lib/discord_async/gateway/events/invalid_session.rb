# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class InvalidSession < Base
        attribute :value, Types::Bool

        def self.new(value_arg=nil, value: nil)
          super(value_arg || value)
        end

        def resumable?
          value
        end
      end
    end
  end
end
