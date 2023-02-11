# frozen_string_literal: true

require 'dry/configurable'
require 'async'
require 'async/websocket'
require 'async/http'
require 'async/http/internet'
require 'json'
require 'logger'
require_relative 'gateway/gateway'
require_relative 'voice'
require_relative 'event_observer'
require_relative 'gateway/events/events'

module DiscordAsync
  RESTClient = Data.define(:version, :token) do
    def get_gateway_bot
      internet = Async::HTTP::Internet.new
      headers = [['accept', 'application/json'], ['Authorization', "Bot #{token}"]]

      response = internet.get "https://discord.com/api/v#{version}/gateway/bot", headers

      data = JSON.parse(response.read)
      pp data
      data
    ensure
      internet.close
    end

    def create_interaction_response(interaction_id, interaction_token)
      internet = Async::HTTP::Internet.new
      headers = [['accept', 'application/json'], ['Content-Type', 'application/json']]
      body = [JSON.dump({ type: 4, data: { content: 'подтверждаю срач' } })]

      internet.post("https://discord.com/api/v10/interactions/#{interaction_id}/#{interaction_token}/callback",
                    headers, body)
    ensure
      internet.close
    end

    def create_message(channel_id, content)
      internet = Async::HTTP::Internet.new
      headers = [['accept', 'application/json'], ['Content-Type', 'application/json'],
                 ['Authorization', "Bot #{token}"]]
      body = [JSON.dump({ content: })]

      internet.post("https://discord.com/api/v10/channels/#{channel_id}/messages", headers, body)
    ensure
      internet.close
    end

    def get_user(user_id)
      internet = Async::HTTP::Internet.new
      headers = [['accept', 'application/json'], ['Content-Type', 'application/json'],
                 ['Authorization', "Bot #{token}"]]
      internet.get("https://discord.com/api/v10/users/#{user_id}", headers).read
    ensure
      internet.close
    end
  end

  class Bot
    attr_reader :rest_client, :gateway, :voice

    include Dry::Configurable
    setting :token

    setting(:rest_api) { setting :version, default: 10 }

    setting :gateway do
      setting :version, default: 10
      setting :encoding, default: :json
      setting :compress, default: nil
      setting :os, default: RUBY_PLATFORM
      setting :browser, default: "Ruby library \"discord_async\" v#{DiscordAsync::VERSION}"
      setting :device, default: "Ruby library \"discord_async\" v#{DiscordAsync::VERSION}"
      setting :large_threshold, default: 50
      setting :intents

      setting :voice do
        setting :version, default: 4
      end
    end

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
