# frozen_string_literal: true

require 'zeitwerk'
require 'async'
require 'debug'

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect 'rest' => 'REST', 'udp' => 'UDP'
loader.setup
loader.eager_load

module DiscordAsync
  LOGGER = Logger.new($stdout)
end
