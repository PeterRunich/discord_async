# frozen_string_literal: true

require 'test_helper'
require 'discord_async/resources/snowflake'
require 'dry-types'

describe DiscordAsync::Snowflake do
  it 'creates from string integer' do
    snowflake_string_integer = '364453157511888896'

    snowflake = DiscordAsync::Snowflake.new snowflake_string_integer

    assert snowflake.is_a? DiscordAsync::Snowflake
    assert_equal 364_453_157_511_888_896, snowflake.instance_variable_get(:@value)
  end

  it 'creates from integer' do
    snowflake_integer = 364_453_157_511_888_896

    snowflake = DiscordAsync::Snowflake.new snowflake_integer

    assert snowflake.is_a? DiscordAsync::Snowflake
    assert_equal 364_453_157_511_888_896, snowflake.instance_variable_get(:@value)
  end

  it 'raise error if none convertable input' do
    assert_raises(Dry::Types::CoercionError) { DiscordAsync::Snowflake.new Object.new }
  end

  it '#to_time' do
    snowflake_string = '364453157511888896'

    snowflake = DiscordAsync::Snowflake.new snowflake_string

    assert_equal Time.at(1_506_962_803.963), snowflake.to_time
  end

  it '#internal_worker_id' do
    snowflake_string = '18446744073709551615'

    snowflake = DiscordAsync::Snowflake.new snowflake_string

    assert_equal 31, snowflake.internal_worker_id
  end

  it '#internal_process_id' do
    snowflake_string = '18446744073709551615'

    snowflake = DiscordAsync::Snowflake.new snowflake_string

    assert_equal 31, snowflake.internal_process_id
  end

  it '#increment' do
    snowflake_string = '18446744073709551615'

    snowflake = DiscordAsync::Snowflake.new snowflake_string

    assert_equal 4095, snowflake.increment
  end

  it '#to_s' do
    snowflake_string = '364453157511888896'

    snowflake = DiscordAsync::Snowflake.new snowflake_string

    assert_equal snowflake_string, snowflake.to_s
  end
end
