# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Channel
      ChannelTypes = Types::Coercible::Integer.enum(
        0 => :guild_text,
        1 => :dm,
        2 => :guild_voice,
        3 => :group_dm,
        4 => :guild_category,
        5 => :guild_announcement,
        10 => :announcement_thread,
        11 => :public_thread,
        12 => :private_thread,
        13 => :guild_stage_voice,
        14 => :guild_directory,
        15 => :guild_forum
      )
    end
  end
end