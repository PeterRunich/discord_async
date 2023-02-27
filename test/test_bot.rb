# frozen_string_literal: true

require 'test_helper'

describe DiscordAsync::Bot do
  let(:bot) { DiscordAsync::Bot.new }

  it '#configure' do
    bot.configure do |cfg|
      cfg.token 'token'
      cfg.encoding :json
      cfg.compress :zlib_stream
      cfg.os 'my os'
      cfg.browser '\(".")/'
      cfg.device '\(".")/'
      cfg.intents 1
      cfg.voice_api_version 4
      cfg.rest_api_version 10
    end

    assert_equal 'token',      bot.config[:token]
    assert_equal :json,        bot.config[:encoding]
    assert_equal :zlib_stream, bot.config[:compress]
    assert_equal 'my os',      bot.config[:os]
    assert_equal '\(".")/',    bot.config[:browser]
    assert_equal '\(".")/',    bot.config[:device]
    assert_equal 1,            bot.config[:intents]
    assert_equal 4,            bot.config[:voice_api_version]
    assert_equal 10,           bot.config[:rest_api_version]
  end

  it 'freeze config object' do
    bot.configure do |cfg|
      cfg.token 'token'
      cfg.intents 1
    end

    assert bot.config.frozen?
  end

  it '#on subscribe to opcode' do
    handler = Minitest::Mock.new
    handler.expect :call, true

    bot.on(opcode: 11) { handler.call }

    obs = bot.instance_variable_get :@observer
    obs.notify DiscordAsync::Gateway::Payload.new op: 11

    assert_mock handler
  end

  it '#on subscribe to event_name' do
    handler = Minitest::Mock.new
    handler.expect :call, true

    bot.on(:voice_server_update) { handler.call }

    obs = bot.instance_variable_get :@observer
    obs.notify DiscordAsync::Gateway::Payload.new(
      op: 0,
      d: {
        token: 'token',
        guild_id: '365197154932883467',
        endpoint: 'endpoint'
      },
      t: 'VOICE_SERVER_UPDATE'
    )

    assert_mock handler
  end

  it '#on subscribe to interaction id' do
    handler = Minitest::Mock.new
    handler.expect :call, true

    bot.on(id: 'click_one') { handler.call }

    obs = bot.instance_variable_get :@observer
    obs.notify DiscordAsync::Gateway::Payload.new({
                                                    't' => 'INTERACTION_CREATE',
                                                    's' => 7,
                                                    'op' => 0,
                                                    'd' => {
                                                      'version' => 1,
                                                      'type' => 3,
                                                      'token' => 'token',
                                                      'message' => {
                                                        'type' => 19,
                                                        'tts' => false,
                                                        'timestamp' => '2023-02-27T18:55:13.853000+00:00',
                                                        'pinned' => false,
                                                        'message_reference' => { 'message_id' => '1079839140469805116', 'guild_id' => '365197154932883467', 'channel_id' => '588056963372548134' },
                                                        'mentions' => [{ 'username' => 'sharn1', 'public_flags' => 4_194_560, 'id' => '364453157511888896', 'display_name' => nil, 'discriminator' => '8807', 'avatar_decoration' => nil, 'avatar' => 'fe33b38b3e36c06208f000af1f2fa545' }],
                                                        'mention_roles' => [],
                                                        'mention_everyone' => false,
                                                        'id' => '1079839141828776077',
                                                        'flags' => 0,
                                                        'embeds' => [],
                                                        'edited_timestamp' => nil,
                                                        'content' => '',
                                                        'components' => [{ 'type' => 1, 'components' => [{ 'type' => 2, 'style' => 3, 'label' => 'Click me 1', 'custom_id' => 'click_one' }] }],
                                                        'channel_id' => '588056963372548134',
                                                        'author' => { 'username' => 'Fenics', 'public_flags' => 0, 'id' => '583320030314364928', 'display_name' => nil, 'discriminator' => '7801', 'bot' => true, 'avatar_decoration' => nil, 'avatar' => nil }, 'attachments' => []
                                                      },
                                                      'member' => { 'user' => { 'username' => 'sharn1', 'public_flags' => 4_194_560, 'id' => '364453157511888896', 'display_name' => nil, 'discriminator' => '8807', 'avatar_decoration' => nil, 'avatar' => 'fe33b38b3e36c06208f000af1f2fa545' },
                                                                    'roles' => [],
                                                                    'premium_since' => nil,
                                                                    'permissions' => '4398046511103',
                                                                    'pending' => false,
                                                                    'nick' => nil,
                                                                    'mute' => false,
                                                                    'joined_at' => '2017-10-04T18:03:06.850000+00:00',
                                                                    'is_pending' => false,
                                                                    'flags' => 0,
                                                                    'deaf' => false,
                                                                    'communication_disabled_until' => nil,
                                                                    'avatar' => nil },
                                                      'locale' => 'ru',
                                                      'id' => '1079839146618658926',
                                                      'guild_locale' => 'en-US',
                                                      'guild_id' => '365197154932883467',
                                                      'entitlement_sku_ids' => [],
                                                      'data' => { 'custom_id' => 'click_one', 'component_type' => 2 },
                                                      'channel_id' => '588056963372548134',
                                                      'application_id' => '583320030314364928',
                                                      'app_permissions' => '4398046511103'
                                                    }
                                                  })

    assert_mock handler
  end
end
