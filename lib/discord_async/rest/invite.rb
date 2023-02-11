# frozen_string_literal: true

module DiscordAsync
  module REST
    module Invite
      def get_invite(invite_code, with_counts: nil, with_expiration: nil, guild_scheduled_event_id: nil)
        @internet.get "#{@base_url}/invites/#{invite_code}#{params({ with_counts:, with_expiration:,
                                                                     guild_scheduled_event_id: })}"
      end

      def delete_invite(invite_code)
        @internet.delete "#{@base_url}/invites/#{invite_code}"
      end
    end
  end
end
