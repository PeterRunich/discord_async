# frozen_string_literal: true

require_relative '../../types'
require_relative 'base'

module DiscordAsync
  class Gateway
    module Events
      class Resume < Base
        attribute :token, Types::Coercible::String
        attribute :session_id, Types::Coercible::String
        attribute :seq, Types::Coercible::Integer
      end
    end
  end
end
