# frozen_string_literal: true

module DiscordAsync
  module Resources
    module User
      class PartialUser < StructBase
        attribute :id, Snowflake
        attribute? :username, Types::Coercible::String
        attribute? :discriminator, Types::Coercible::String
        attribute? :banner_color, Types::Coercible::String
        attribute? :avatar, Types::Coercible::String.optional
        attribute? :bot, Types::Bool
        attribute? :system, Types::Bool
        attribute? :mfa_enabled, Types::Bool
        attribute? :banner, Types::Coercible::String.optional
        attribute? :accent_color, Types::Coercible::Integer.optional
        attribute? :locale, Types::Coercible::String
        attribute? :verified, Types::Bool
        attribute? :email, Types::Coercible::String.optional
        attribute? :flags, Types::Coercible::Integer
        attribute? :premium_type, Types::Coercible::Integer
        attribute? :public_flags, Types::Coercible::Integer
        attribute? :avatar_decoration, Types::Nominal::Any
      end
    end
  end
end
