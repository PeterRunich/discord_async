# frozen_string_literal: true
# require 'zeitwerk'

# loader = Zeitwerk::Loader.for_gem
# loader.setup

require_relative 'discord_async/version'
require_relative 'discord_async/bot'
require_relative 'discord_async/application_command/manager'
require_relative 'discord_async/errors'


module DiscordAsync
end
