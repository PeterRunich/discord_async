# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class GuildUpdate < Base
        attribute :guild, Resources::Guild::Guild

        def self.new(attributes) = super(guild: attributes)
      end
    end
  end
end
