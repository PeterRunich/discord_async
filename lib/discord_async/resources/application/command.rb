# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Application
      module Command
        module_function

        def new(*, **, &) = Command.new(*, **, &)
      end
    end
  end
end