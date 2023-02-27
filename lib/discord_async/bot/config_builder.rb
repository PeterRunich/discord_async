# frozen_string_literal: true

module DiscordAsync
  class Bot
    # A builder for the Config class created because I want to set settings
    # similar to the example below and pass all the settings in one hash to
    # AnywayConfig.new for types coerce
    # @example
    #   cfg.token 'token value'
    class ConfigBuilder
      attr_reader :result

      def initialize = @result = {}

      %i[token encoding compress os browser device intents voice_api_version rest_api_version].each do |attr_name|
        define_method attr_name do |value|
          @result[attr_name] = value
        end
      end
    end
  end
end
