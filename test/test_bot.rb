# frozen_string_literal: true

require 'test_helper'

describe 'Bot' do
  let(:bot) { DiscordAsync::Bot.new }

  describe 'configuration' do
    it 'has config fields' do
      gateway_config_fields = %i[version encoding compress os browser device large_threshold intents]

      assert_respond_to bot.config, :token
      assert_respond_to bot.config.rest_api, :version
      gateway_config_fields.each { |field_name| assert_respond_to bot.config.gateway, field_name }
    end

    it 'has default values' do
      assert bot.config.rest_api.version == 10
      bot.config.gateway.tap do |gateway|
        assert gateway.version == 10
        assert gateway.encoding == :json
        assert gateway.compress.nil?
        assert gateway.os == RUBY_PLATFORM
        assert gateway.browser == "Ruby library \"discord_async\" v#{DiscordAsync::VERSION}"
        assert gateway.device == "Ruby library \"discord_async\" v#{DiscordAsync::VERSION}"
        assert gateway.large_threshold == 50
      end
    end
  end

  describe 'application command definition' do
    it 'initialize application command definition' do
      skip
    end
  end
end
