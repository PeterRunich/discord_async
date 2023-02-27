# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Application
      module Command
        OptionTypes = Types::Coercible::Integer.enum(
          1 => :sub_command,
          2 => :sub_command_group,
          3 => :string,
          4 => :integer,
          5 => :boolean,
          6 => :user,
          7 => :channel,
          8 => :role,
          9 => :mentionable,
          10 => :number,
          11 => :attachment
        )
      end
    end
  end
end
