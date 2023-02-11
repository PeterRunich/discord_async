# frozen_string_literal: true

require_relative '../../types'

module DiscordAsync
  module Resources
    class Sticker < Dry::Struct
      StickerFormat = Types::Integer.enum(1 => :png, 2 => :apng, 3 => :lottie, 4 => :gif)
    end
  end
end
