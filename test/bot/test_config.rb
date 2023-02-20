# frozen_string_literal: true

require 'test_helper'

describe DiscordAsync::Bot::Config do
  subject { DiscordAsync::Bot::Config }

  it 'sets all possible settings' do
    cfg = subject.new token: 'token',
                      encoding: :json,
                      compress: :zlib_stream,
                      os: 'my os',
                      browser: '\(".")/',
                      device: '\(".")/',
                      intents: 1,
                      voice_api_version: 4,
                      rest_api_version: 10

    assert_equal 'token',      cfg.token
    assert_equal :json,        cfg.encoding
    assert_equal :zlib_stream, cfg.compress
    assert_equal 'my os',      cfg.os
    assert_equal '\(".")/',    cfg.browser
    assert_equal '\(".")/',    cfg.device
    assert_equal 1,            cfg.intents
    assert_equal 4,            cfg.voice_api_version
    assert_equal 10,           cfg.rest_api_version
  end

  it 'sets the defaults' do
    cfg = subject.new token: 'token', intents: 1

    assert_equal :json, cfg.encoding
    assert_nil cfg.compress
    assert_equal RUBY_PLATFORM, cfg.os
    assert_includes cfg.browser, 'discord_async'
    assert_includes cfg.device, 'discord_async'
    assert_equal 4, cfg.voice_api_version
    assert_equal 10, cfg.rest_api_version
  end

  it 'coerces the types' do
    cfg = subject.new token: :token,
                      encoding: 'json',
                      compress: 'zlib_stream',
                      os: :my_os,
                      browser: :smth,
                      device: :smth,
                      intents: '1',
                      voice_api_version: '4',
                      rest_api_version: '10'

    assert_equal 'token',      cfg.token
    assert_equal :json,        cfg.encoding
    assert_equal :zlib_stream, cfg.compress
    assert_equal 'my_os',      cfg.os
    assert_equal 'smth',    cfg.browser
    assert_equal 'smth',    cfg.device
    assert_equal 1,            cfg.intents
    assert_equal 4,            cfg.voice_api_version
    assert_equal 10,           cfg.rest_api_version
  end

  it 'raises an error when the required setting are not passed' do
    assert_raises(Anyway::Config::ValidationError) { subject.new }
  end
end
