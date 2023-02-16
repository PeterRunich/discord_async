# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Application
      module Command
        CommandTypes = Types::Coercible::Integer.enum(
          1 => :chat_input,
          2 => :user,
          3 => :message
        )
      end
    end
  end
end
