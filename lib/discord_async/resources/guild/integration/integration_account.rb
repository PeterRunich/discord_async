# frozen_string_literal: true

require_relative '../../../types'

module DiscordAsync
  module Resources
    class Guild < Dry::Struct
      class Integration < Dry::Struct
        class IntegrationAccount < Dry::Struct
          transform_keys(&:to_sym)

          attribute :id, Types::Coercible::String
          attribute :name, Types::Coercible::String
        end
      end
    end
  end
end
