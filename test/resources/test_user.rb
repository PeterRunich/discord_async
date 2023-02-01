# frozen_string_literal: true

require 'test_helper'
require 'discord_async/resources/user/user'
require 'discord_async/resources/snowflake'

describe DiscordAsync::Resources::User do
  it 'creates with not nil attributes' do
    data = {
      id: '364453157511888896',
      username: 'sharn1',
      discriminator: '8807',
      banner_color: '#171a1a',
      avatar: 'any_avatar_hash',
      bot: false,
      system: false,
      mfa_enabled: false,
      banner: 'any_banner_hash',
      accent_color: 13399842,
      locale: 'ru',
      verified: true,
      email: 'p.runich@bk.ru',
      flags: 256,
      premium_type: 0,
      public_flags: 256
    }

    user = DiscordAsync::Resources::User.new(**data)

    assert_kind_of DiscordAsync::Snowflake, user.id
    assert_kind_of String, user.username
    assert_kind_of String, user.discriminator
    assert_kind_of String, user.avatar
    assert_kind_of String, user.banner_color
    assert_kind_of_boolean user.bot
    assert_kind_of_boolean user.system
    assert_kind_of_boolean user.mfa_enabled
    assert_kind_of String, user.banner
    assert_kind_of Integer, user.accent_color
    assert_kind_of String, user.locale
    assert_kind_of_boolean user.verified
    assert_kind_of String, user.email
    assert_kind_of Integer, user.flags
    assert_kind_of Integer, user.premium_type
    assert_kind_of Integer, user.public_flags
  end

  it 'creates nillable attributes with value nil' do
    data = {
      id: '364453157511888896',
      username: 'sharn1',
      discriminator: '8807',
      banner_color: '#171a1a',
      avatar: nil
    }

    user = DiscordAsync::Resources::User.new(**data)

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
