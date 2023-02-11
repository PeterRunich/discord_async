# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Interaction < StructBase
      InteractionTypes = Types::Integer.enum(1 => :ping, 2 => :application_command, 3 => :message_component,
                                             4 => :application_command_autocomplete, 5 => :modal_submit)
    end
  end
end
