module DiscordAsync
  class Error < StandardError
  end

  class CommandTypeNotSupportOptions < Error
  end

  class InvalidSnowflakeLengthValue < Error
  end
end
