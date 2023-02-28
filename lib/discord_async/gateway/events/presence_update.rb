# frozen_string_literal: true

module DiscordAsync
  module Gateway
    module Events
      # TODO: All classes maybe useless, instead use nested attributes
      class ActivityButtons < StructBase
        attribute :label, Types::Coercible::String
        attribute :url, Types::Coercible::String
      end

      class ActivitySecrets < StructBase
        attribute? :join, Types::Coercible::String
        attribute? :spectate, Types::Coercible::String
        attribute? :match, Types::Coercible::String
      end

      class ActivityAssets < StructBase
        attribute? :large_image, Types::Coercible::String
        attribute? :large_text, Types::Coercible::String
        attribute? :small_image, Types::Coercible::String
        attribute? :small_text, Types::Coercible::String
      end

      class ActivityParty < StructBase
        attribute? :id, Types::Coercible::String
        attribute? :size, Types::Array.of(Types::Coercible::Integer)
      end

      class ActivityEmoji < StructBase
        attribute :name, Types::Coercible::String
        attribute :id, Resources::Snowflake
        attribute :animated, Types::Bool
      end

      class ActivityTimestamps < StructBase
        attribute? :start, Types::Coercible::Integer
        attribute? :end, Types::Coercible::Integer
      end

      class Activity < StructBase
        attribute :name, Types::Coercible::String
        attribute :type, Types::Coercible::Integer
        attribute? :url, Types::Coercible::String.optional
        attribute :created_at, Types::Coercible::Integer.optional
        attribute? :timestamps, ActivityTimestamps
        attribute? :application_id, Resources::Snowflake
        attribute? :details, Types::Coercible::String.optional
        attribute? :state, Types::Coercible::String.optional
        attribute? :emoji, ActivityEmoji.optional
        attribute? :party, ActivityParty
        attribute? :assets, ActivityAssets
        attribute? :secrets, ActivitySecrets
        attribute? :instance, Types::Bool
        attribute? :flags, Types::Coercible::Integer
        attribute? :buttons, Types::Array.of(ActivityButtons)
      end

      class ClientStatus < StructBase
        attribute? :desktop, Types::Coercible::String
        attribute? :mobile, Types::Coercible::String
        attribute? :web, Types::Coercible::String
      end

      class PresenceUpdate < Base
        attribute :user, Resources::User::PartialUser
        attribute :guild_id, Resources::Snowflake
        attribute :status, Types::Coercible::String
        attribute :activities, Types::Array.of(Activity)
        attribute :client_status, ClientStatus
      end
    end
  end
end
