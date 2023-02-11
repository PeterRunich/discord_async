# frozen_string_literal: true

require_relative 'base'
require_relative '../../types'

module DiscordAsync
  class Gateway
    module Events
      class InvalidSession < Base
        attribute :value, Types::Bool

        def initialize(value)
          super(value:)
        end

        def resumable?
          value
        end
      end
    end
  end
end
