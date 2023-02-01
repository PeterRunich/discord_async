# frozen_string_literal: true

require 'test_helper'

describe DiscordAsync::VERSION do
  it 'must have version' do
    refute_nil DiscordAsync::VERSION
  end
end
