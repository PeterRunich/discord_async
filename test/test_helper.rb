# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'discord_async'
require 'debug'

require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'color_pound_spec_reporter'

Minitest::Reporters.use! [ColorPoundSpecReporter.new] unless ENV['RM_INFO']
