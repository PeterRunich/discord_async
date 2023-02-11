# frozen_string_literal: true

require_relative 'base'
require_relative '../../resources/channel/channel'

module DiscordAsync
  class Gateway
    module Events
      class ThreadCreate < Base
        attribute :channel, Resources::Channel
        attribute? :newly_created, Types::Bool

        def initialize(attributes)
          attributes.transform_keys!(&:to_sym)

          super(channel: attributes.exclude(:newly_created), newly_created: attributes[:newly_created])
        end
      end
    end
  end
end
