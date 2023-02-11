# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Guild < StructBase
      class Integration < StructBase
        class IntegrationAccount < StructBase
          attribute :id, Types::Coercible::String
          attribute :name, Types::Coercible::String
        end
      end
    end
  end
end
