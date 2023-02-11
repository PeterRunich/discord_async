# frozen_string_literal: true

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
