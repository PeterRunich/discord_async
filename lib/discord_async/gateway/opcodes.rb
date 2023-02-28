# frozen_string_literal: true

module DiscordAsync
  module Gateway
    Opcodes = Types::Coercible::Integer.enum(
      0 => :dispatch,
      1 => :heartbeat,
      2 => :identify,
      3 => :presence_update,
      4 => :voice_state_update,
      6 => :resume,
      7 => :reconnect,
      8 => :request_guild_members,
      9 => :invalid_session,
      10 => :hello,
      11 => :heartbeat_ack
    )
  end
end
