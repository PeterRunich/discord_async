# frozen_string_literal: true

require 'test_helper'
require 'discord_async/resources/application/application'
require 'discord_async/resources/snowflake'

describe DiscordAsync::Resources::Application do
  it 'creates with not nil attributes' do
    skip
    data = {
      id: '583320030314364928',
      name: 'Fenics',
      icon: 'any_icon_hash',
      description: 'my app',
      rpc_origins: %w[i dont know what it is],
      bot_public: false,
      bot_require_code_grant: false,
      terms_of_service_url: 'url',
      privacy_policy_url: 'url',
      owner: ''
    }

    user = DiscordAsync::Application.new(**data)

    assert_kind_of String, user.banner_color
    assert_kind_of_boolean user.bot
  end

  it 'creates nillable attributes with value nil' do
    skip
    user_data = {
      id: '364453157511888896',
      username: 'sharn1',
      discriminator: '8807',
      banner_color: '#171a1a'
    }

    user = DiscordAsync::User.new(**user_data)

    [
      user.avatar,
      user.avatar_decoration,
      user.bot,
      user.verified,
      user.verified,
      user.banner,
      user.accent_color,
      user.locale,
      user.verified,
      user.email,
      user.flags,
      user.premium_type,
      user.public_flags
    ].all? { |attribute| assert_nil attribute }
  end
end