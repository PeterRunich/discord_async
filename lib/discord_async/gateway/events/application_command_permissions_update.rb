# frozen_string_literal: true

module DiscordAsync
  class Gateway
    module Events
      class ApplicationCommandPermissionsUpdate < Base
        attribute :application_command_permissions, Resources::Application::ApplicationCommandPermissions

        def initialize(attributes)
          super(application_command_permissions: attributes)
        end
      end
    end
  end
end
