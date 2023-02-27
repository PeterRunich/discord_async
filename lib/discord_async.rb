# frozen_string_literal: true

require 'zeitwerk'
require 'async'

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect 'rest' => 'REST', 'udp' => 'UDP'
loader.setup
loader.eager_load

module DiscordAsync
end
