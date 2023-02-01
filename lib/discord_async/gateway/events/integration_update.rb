require_relative 'base'
require_relative '../../resources/guild/integration/integration'

module DiscordAsync
  class Gateway
    module Events
      class IntegrationUpdate < Base
        attribute :integration, Resources::Guild::Integration
        attribute :guild_id, Types::Snowflake

        def initialize(attributes)
          attributes.transform_keys!(&:to_sym)

          super(integration: attributes.exclude(:guild_id), guild_id: attributes[:guild_id])
        end
      end
    end
  end
end
