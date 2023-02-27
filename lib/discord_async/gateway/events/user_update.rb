# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class UserUpdate < Base
        attribute :user, Resources::User::User

        def initialize(attributes)
          super(user: attributes)
        end
      end
    end
  end
end
