# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Guild
      module Integration
        class Account < StructBase
          attribute :id, Types::Coercible::String
          attribute :name, Types::Coercible::String
        end
      end
    end
  end
end
