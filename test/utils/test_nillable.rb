# frozen_string_literal: true

require 'test_helper'
require 'discord_async/utils/nillable'

describe DiscordAsync::Utils do
  it 'return nil if input values is nil' do
    assert_nil DiscordAsync::Utils::NillableValue::Nillable[nil]
  end

  it 'use callable to figure out value' do
    value = 1

    coerced_value = DiscordAsync::Utils::NillableValue::Nillable[value, method(:String)]

    assert_equal coerced_value, String(value)
  end


  it 'use block to figure out value' do
    value = 1

    coerced_value = DiscordAsync::Utils::NillableValue::Nillable[value] { |*a| String(*a) }

    assert_equal coerced_value, String(value)
  end
end