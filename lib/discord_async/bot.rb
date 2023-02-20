# frozen_string_literal: true

require 'logger'

module DiscordAsync
  class Bot
    def initialize
      @event_observer = EventObserver.new
    end

    def join_to_voice(guild_id, channel_id, gateway)
      @voice = Voice.new
      @voice.start gateway, guild_id, channel_id, config.gateway.voice.version
      @voice
    end

    def start
      Async do
        @rest_client = RESTClient[version: config.rest_api.version, token: config.token]
        @gateway = DiscordAsync::Gateway.new config.token

        @gateway.event_repeater.subscribe ->(e) { @event_observer.notify e }

        identify_data = {
          token: config.token,
          properties: { os: config.gateway.os, browser: config.gateway.browser, device: config.gateway.device },
          intents: config.gateway.intents,
          compress: config.gateway.compress,
          large_threshold: config.gateway.large_threshold
        }

        @gateway.start(@rest_client.get_gateway_bot['url'], config.gateway.version, config.gateway.encoding,
                       identify_data)
      end.wait
    end

    def on(event_symbol, once: false, &callback)
      opcode = Gateway::Opcodes[:dispatch]
      event_name = Gateway::Events.const_get(event_symbol.to_s.split('_').collect(&:capitalize).join).event_name

      @event_observer.subscribe opcode:, callback:, event_name:, once:
    end
  end
end
