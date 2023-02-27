# frozen_string_literal: true

require 'test_helper'

describe DiscordAsync::Bot::ConfigBuilder do
  subject { DiscordAsync::Bot::ConfigBuilder }

  it 'builds config' do
    cfg_builder = subject.new

    cfg_builder.token 'token'
    cfg_builder.encoding :json
    cfg_builder.compress :zlib_stream
    cfg_builder.os 'my os'
    cfg_builder.browser '\(".")/'
    cfg_builder.device '\(".")/'
    cfg_builder.intents 1
    cfg_builder.voice_api_version 4
    cfg_builder.rest_api_version 10

    assert_equal({
                   token: 'token',
                   encoding: :json,
                   compress: :zlib_stream,
                   os: 'my os',
                   browser: '\(".")/',
                   device: '\(".")/',
                   intents: 1,
                   voice_api_version: 4,
                   rest_api_version: 10
                 }, cfg_builder.result)
  end
end
