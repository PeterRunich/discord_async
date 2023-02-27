# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Webhook
      WebhookTypes = Types::Coercible::Integer.enum(
        1 => :incoming,
        2 => :channel_follower,
        3 => :application
      )
    end
  end
end
