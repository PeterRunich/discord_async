# frozen_string_literal: true

require_relative '../../types'
require_relative '../snowflake'

module DiscordAsync
  module Resources
    class User < Dry::Struct
      transform_keys(&:to_sym)

      attribute :id, Types::Snowflake
      attribute :username, Types::Coercible::String
      attribute :discriminator, Types::Coercible::String
      attribute? :banner_color, Types::Coercible::String.optional
      attribute :avatar, Types::Coercible::String.optional

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

    class PartialUser < Dry::Struct
      transform_keys(&:to_sym)

      attribute :id, Types::Snowflake

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
