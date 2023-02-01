require_relative 'base'
require_relative '../../types'
require_relative '../../resources/snowflake'
require_relative '../../resources/user/user'

module DiscordAsync
  class Gateway
    module Events
      class ActivityButtons < Dry::Struct
        attribute :label, Types::Coercible::String
        attribute :url, Types::Coercible::String
      end

      class ActivitySecrets < Dry::Struct
        attribute? :join, Types::Coercible::String
        attribute? :spectate, Types::Coercible::String
        attribute? :match, Types::Coercible::String
      end

      class ActivityAssets < Dry::Struct
        attribute? :large_image, Types::Coercible::String
        attribute? :large_text, Types::Coercible::String
        attribute? :small_image, Types::Coercible::String
        attribute? :small_text, Types::Coercible::String
      end

      class ActivityParty < Dry::Struct
        attribute? :id, Types::Coercible::String
        attribute? :size, Types::Array.of(Types::Coercible::Integer)
      end

      class ActivityEmoji < Dry::Struct
        attribute :name, Types::Coercible::String
        attribute :id, Types::Snowflake
        attribute :animated, Types::Bool
      end

      class ActivityTimestamps < Dry::Struct
        attribute? :start, Types::Coercible::Integer
        attribute? :end, Types::Coercible::Integer
      end

      class Activity < Dry::Struct
        attribute :name, Types::Coercible::String
        attribute :type, Types::Coercible::Integer
        attribute? :url, Types::Coercible::String.optional
        attribute :created_at, Types::Coercible::Integer.optional
        attribute? :timestamps, ActivityTimestamps
        attribute? :application_id, Types::Snowflake
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

      class ClientStatus < Dry::Struct
        attribute? :desktop, Types::Coercible::String
        attribute? :mobile, Types::Coercible::String
        attribute? :web, Types::Coercible::String
      end

      class PresenceUpdate < Base
        attribute :user, Resources::PartialUser
        attribute :guild_id, Types::Snowflake
        attribute :status, Types::Coercible::String
        attribute :activities, Types::Array.of(Activity)
        attribute :client_status, ClientStatus
      end
    end
  end
end
