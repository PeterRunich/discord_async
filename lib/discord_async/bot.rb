# frozen_string_literal: true

require 'json'

module DiscordAsync
  class Bot
    attr_reader :config, :rest_client

    def initialize = @observer = Gateway::Observer.new

    def configure
      config_builder = ConfigBuilder.new
      yield config_builder
      @config = Config.new(config_builder.result).to_h
    end

    def on(event_name = nil, opcode: nil, id: nil, &callback)
      condition_block = lambda do |e|
        invoke = false
        invoke = (e.t == event_name.upcase) if event_name
        invoke = (e.op == opcode) if opcode
        if id
          invoke = (
            e.d.is_a?(Gateway::Events::InteractionCreate) &&
            (
              e.d.interaction.data.is_a?(Resources::Interaction::MessageComponentData) ||
              e.d.interaction.data.is_a?(Resources::Interaction::ModalSubmitData)
            ) &&
            e.d.interaction.data.custom_id == id
          )
        end

        callback[e] if invoke
      end

      @observer.subscribe condition_block
    end

    def join_to_voice(guild_id, channel_id, gateway)
      @voice = Voice.new
      @voice.start gateway, guild_id, channel_id, config.gateway.voice.version
      @voice
    end

    def start(large_threshold: nil)
      Async do
        @rest_client = REST::Client.new(
          config[:token],
          583_320_030_314_364_928, # TODO: smth do with app_id and config
          version: config[:rest_api_version]
        )
        @gateway = DiscordAsync::Gateway::Gateway.new config[:token]

        @gateway.event_repeater.subscribe ->(e) { @observer.notify e }

        identify_data = {
          token: config[:token],
          properties: {
            os: config[:os],
            browser: config[:browser],
            device: config[:device]
          },
          intents: config[:intents],
          compress: !config[:compress].nil?,
          large_threshold: large_threshold
        }.compact!

        @gateway.start(
          JSON.parse(@rest_client.get_gateway.read)['url'],
          config[:rest_api_version],
          config[:encoding],
          identify_data
        )
      end.wait
    end
  end
end
