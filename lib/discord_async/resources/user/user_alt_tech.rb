# frozen_string_literal: true

require_relative '../snowflake'
require_relative '../../conversions/boolean'
require_relative '../../utils/proto_files/nillable'
# TODO: В доке нет поля avatar_decoration banner_color
module DiscordAsync
  class User < Data.define(*%i[id username discriminator banner_color avatar bot system mfa_enabled banner accent_color locale verified email flags premium_type public_flags avatar_decoration])
    include Conversions::BooleanType
    include Utils::NillableValue

    # rubocop:disable Layout/HashAlignment, Metrics/ParameterLists
    def initialize(
      id:,
      username:,
      discriminator:,
      banner_color:,
      avatar: nil,
      bot: nil,
      system: nil,
      mfa_enabled: nil,
      banner: nil,
      accent_color: nil,
      locale: nil,
      verified: nil,
      email: nil,
      flags: nil,
      premium_type: nil,
      public_flags: nil,
      avatar_decoration: nil
    )
      super(
        id:           Snowflake.new(id),
        username:     String(username),
        discriminator:String(discriminator),
        banner_color: String(banner_color),
        avatar:       Nillable[avatar] { String(_1) },
        bot:          Nillable[bot] { Boolean(_1) },
        system:       Nillable[system] { Boolean(_1) },
        mfa_enabled:  Nillable[mfa_enabled] { Boolean(_1) },
        banner:       Nillable[banner] { String(_1) },
        accent_color: Nillable[accent_color] { Integer(_1) },
        locale:       Nillable[locale] { String(_1) },
        verified:     Nillable[verified] { Boolean(_1) },
        email:        Nillable[email] { String(_1) },
        flags:        Nillable[flags] { Integer(_1) },
        premium_type: Nillable[premium_type] { Integer(_1) },
        public_flags: Nillable[public_flags] { Integer(_1) },
        avatar_decoration: avatar_decoration, # Undocumentet type
      )
    end
    # rubocop:enable Layout/HashAlignment, Metrics/ParameterLists
  end
end