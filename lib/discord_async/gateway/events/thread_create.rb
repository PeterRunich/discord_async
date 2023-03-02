# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      class ThreadCreate < Base
        attribute :channel, Resources::Channel::Channel
        attribute? :newly_created, Types::Bool

        def self.new(attributes)
          attributes = attributes.transform_keys(&:to_sym)

          super(channel: attributes.except(:newly_created), newly_created: attributes[:newly_created])
        end
      end
    end
  end
end
