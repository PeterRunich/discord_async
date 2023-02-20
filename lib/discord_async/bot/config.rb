# frozen_string_literal: true

require 'anyway_config'

module DiscordAsync
  class Bot
    # Collect the settings needed for the bot to work
    class Config < Anyway::Config
      # AnywayConfig uses config_name to parse env variable with prefix BOT_*
      config_name :bot

      # @param token used for authentication
      # @param encoding  used in gateway WS url params
      # @param compress used in gateway WS url params
      # @param os used in gateway identifying
      # @param browser used in gateway identifying
      # @param device used in gateway identifying
      # @param intents used in gateway identifying
      # @param voice_api_version used in voice connection WS url
      # @param rest_api_version gateway WS and REST API urls share same version
      attr_config(
        :token,
        encoding: :json,
        compress: nil,
        os: RUBY_PLATFORM,
        browser: "Ruby library \"discord_async\" v#{DiscordAsync::VERSION}",
        device: "Ruby library \"discord_async\" v#{DiscordAsync::VERSION}",
        intents: nil,
        voice_api_version: 4,
        rest_api_version: 10
      )

      required :token, :intents

      # Be aware that AnywayConfig applies coercion only during a call #new
      # @example When coercion works
      #   Config.new token: 'some token', intents: '0'
      # @example When coercion doesn't work
      #   cfg = Config.new token: 'some token', intents: some_integer_intent
      #   cfg.intents = '0' # '0' will not be coerced to integer 0
      coerce_types token: :string,
                   encoding: Gateway::EncodingTypes,
                   compress: Gateway::CompressTypes.optional,
                   os: :string,
                   browser: :string,
                   device: :string,
                   intents: :integer,
                   voice_api_version: :integer,
                   rest_api_version: :integer
    end
  end
end
