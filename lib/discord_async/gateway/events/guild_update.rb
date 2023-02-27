# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class GuildUpdate < Base
        attribute :guild, Resources::Guild::Guild

        def initialize(attributes)
          super(guild: attributes)
        end
      end
    end
  end
end
