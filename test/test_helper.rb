# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'discord_async'

require 'minitest/autorun'
require 'minitest/pride'
require 'color_pound_spec_reporter'
require 'minitest/stub_any_instance'
require 'spy/integration'
require_relative 'boolean_assertion'

Minitest::Reporters.use! [ColorPoundSpecReporter.new] unless ENV['RM_INFO']