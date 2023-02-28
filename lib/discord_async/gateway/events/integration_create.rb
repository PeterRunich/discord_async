# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class IntegrationCreate < Base
        attribute :integration, Resources::Guild::Integration::Integration
        attribute :guild_id, Resources::Snowflake

        def initialize(attributes)
          attributes = attributes.transform_keys(&:to_sym)

          super(integration: attributes.exclude(:guild_id), guild_id: attributes[:guild_id])
        end
      end
    end
  end
end
