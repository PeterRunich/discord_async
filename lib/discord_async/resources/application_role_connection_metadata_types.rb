# frozen_string_literal: true

module DiscordAsync
  module Resources
    ApplicationRoleConnectionMetadataTypes = Types::Coercible::Integer.enum(
      1 => :integer_less_than_or_equal,
      2 => :integer_greater_than_or_equal,
      3 => :integer_equal,
      4 => :integer_not_equal,
      5 => :datetime_less_than_or_equal,
      6 => :datetime_greater_than_or_equal,
      7 => :boolean_equal,
      8 => :boolean_not_equal
    )
  end
end
