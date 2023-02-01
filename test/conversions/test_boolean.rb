# frozen_string_literal: true

require 'test_helper'
require 'discord_async/conversions/boolean'

describe DiscordAsync::Conversions do
  it 'coerce to false' do
    false_values = [
      false, 0,
      '0', :"0",
      'f', :f,
      'F', :F,
      'false', :false,
      'FALSE', :FALSE,
      'off', :off,
      'OFF', :OFF,
      ''
    ]

    false_values.each do |v|
      assert DiscordAsync::Conversions::BooleanType::Boolean(v) == false
    end
  end

  it 'coerce to true' do
    value = 'any value which is not in FALSE_VALUES'

    assert DiscordAsync::Conversions::BooleanType::Boolean(value)
  end
end