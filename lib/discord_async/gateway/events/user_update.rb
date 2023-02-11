# frozen_string_literal: true

module DiscordAsync
  class Gateway
    module Events
      class UserUpdate < Base
        attribute :user, Resources::User

        def initialize(attributes)
          super(user: attributes)
        end
      end
    end
  end
end
