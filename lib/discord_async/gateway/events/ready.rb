# frozen_string_literal: true

require_relative 'base'
require_relative '../../types'
require_relative '../../resources/user/user'
require_relative '../../resources/guild/unavailable_guild'
require_relative '../../resources/application/partial_application'

module DiscordAsync
  class Gateway
    module Events
      class Ready < Base
        attribute :v, Types::Coercible::Integer
        attribute :user, Resources::User
        attribute :guilds, Resources::Guild::UnavailableGuild
        attribute :session_id, Types::Coercible::String
        attribute :resume_gateway_url, Types::Coercible::String
        attribute? :shard, Types::Array.of(Types::Coercible::Integer)
        attribute :application, Resources::Application::PartialApplication
      end
    end
  end
end
