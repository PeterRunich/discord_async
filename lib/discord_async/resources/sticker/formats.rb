# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Sticker
      Formats = Types::Coercible::Integer.enum(
        1 => :png,
        2 => :apng,
        3 => :lottie,
        4 => :gif
      )
    end
  end
end
