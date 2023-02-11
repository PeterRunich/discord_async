# frozen_string_literal: true

module DiscordAsync
  module REST
    module Channel
      def get_channel(channel_id)
        @internet.get "#{@base_url}/channels/#{channel_id}"
      end

      def modify_channel(channel_id, body)
        @internet.patch "#{@base_url}/channel/#{channel_id}", default_headers, body
      end

      def delete_channel(channel_id)
        @internet.delete "#{@base_url}/channels/#{channel_id}"
      end

      def get_channel_messages(channel_id, around: nil, before: nil, after: nil, limit: nil)
        @internet.get "#{@base_url}/channels/#{channel_id}/messages#{params({ around:, before:, after:, limit: })}"
      end

      def get_channel_message(channel_id, message_id)
        @internet.get "#{@base_url}/channels/#{channel_id}/messages/#{message_id}"
      end

      def create_message(channel_id, body)
        @internet.post "#{@base_url}/channels/#{channel_id}/messages", default_headers, body
      end

      def crosspost_message(channel_id, message_id, body)
        @internet.post "#{@base_url}/channels/#{channel_id}/messages/#{message_id}/crosspost", default_headers, body
      end

      def create_reaction(channel_id, message_id, emoji, body)
        @internet.put "#{@base_url}/channels/#{channel_id}/messages/#{message_id}/reactions/#{emoji}/@me",
                      default_headers, body
      end

      def delete_own_reaction(channel_id, message_id, emoji)
        @internet.delete "#{@base_url}/channels/#{channel_id}/messages/#{message_id}/reactions/#{emoji}/@me"
      end

      def delete_user_reaction(channel_id, message_id, emoji, user_id)
        @internet.delete "#{@base_url}/channels/#{channel_id}/messages/#{message_id}/reactions/#{emoji}/#{user_id}"
      end

      def get_reactions(channel_id, message_id, emoji, after: nil, limit: nil)
        @internet.get "#{@base_url}/channels/#{channel_id}/messages/#{message_id}/reactions/#{emoji}#{params({ after:,
                                                                                                               limit: })}"
      end

      def delete_all_reactions(channel_id, message_id)
        @internet.delete "#{@base_url}/channels/#{channel_id}/messages/#{message_id}/reactions"
      end

      def delete_all_reactions_for_emoji(channel_id, message_id, emoji)
        @internet.delete "#{@base_url}/channels/#{channel_id}/messages/#{message_id}/reactions/#{emoji}"
      end

      def edit_message(channel_id, message_id, body)
        @internet.patch "#{@base_url}/channels/#{channel_id}/messages/#{message_id}", default_headers, body
      end

      def delete_message(channel_id, message_id)
        @internet.delete "#{@base_url}/channels/#{channel_id}/messages/#{message_id}"
      end

      def bulk_delete_messages(channel_id, body)
        @internet.post "#{@base_url}/channels/#{channel_id}/messages/bulk-delete", default_headers, body
      end

      def edit_channel_permissions(channel_id, overwrite_id, body)
        @internet.put "#{@base_url}/channels/#{channel_id}/permissions/#{overwrite_id}", default_headers, body
      end

      def get_channel_invites(channel_id)
        @internet.get "#{@base_url}/channels/#{channel_id}/invites"
      end

      def create_channel_invite(channel_id, body)
        @internet.post "#{@base_url}/channels/#{channel_id}/invites", default_headers, body
      end

      def delete_channel_permission(channel_id, overwrite_id)
        @internet.delete "#{@base_url}/channels/#{channel_id}/permissions/#{overwrite_id}"
      end

      def follow_announcement_channel(channel_id, body)
        @internet.post "#{@base_url}/channels/#{channel_id}/followers", default_headers, body
      end

      def trigger_typing_indicator(channel_id)
        @internet.post "#{@base_url}/channels/#{channel_id}/typing"
      end

      def get_pinned_messages(channel_id)
        @internet.get "#{@base_url}/channels/#{channel_id}/pins"
      end

      def pin_message(channel_id, message_id)
        @internet.put "#{@base_url}/channels/#{channel_id}/pins/#{message_id}"
      end

      def unpin_message(channel_id, message_id)
        @internet.delete "#{@base_url}/channels/#{channel_id}/pins/#{message_id}"
      end

      def group_dm_add_recipient(channel_id, user_id, body)
        @internet.put "#{@base_url}/channels/#{channel_id}/recipients/#{user_id}", default_headers, body
      end

      def group_dm_remove_recipient(channel_id, user_id)
        @internet.delete "#{@base_url}/channels/#{channel_id}/recipients/#{user_id}"
      end

      def start_thread_from_message(channel_id, message_id, body)
        @internet.post "#{@base_url}/channels/#{channel_id}/messages/#{message_id}/threads", default_headers, body
      end

      def start_thread_without_message(channel_id, body)
        @internet.post "#{@base_url}/channels/#{channel_id}/threads", default_headers, body
      end

      def start_thread_in_forum_channel(channel_id, body)
        @internet.post "#{@base_url}/channels/#{channel_id}/threads", default_headers, body
      end

      def join_thread(channel_id)
        @internet.put "#{@base_url}/channels/#{channel_id}/thread-members/@me"
      end

      def add_thread_member(channel_id, user_id)
        @internet.put "#{@base_url}/channels/#{channel_id}/thread-members/#{user_id}"
      end

      def leave_thread(channel_id)
        @internet.delete "#{@base_url}/channels/#{channel_id}/thread-members/@me"
      end

      def remove_thread_member(channel_id, user_id)
        @internet.delete "#{@base_url}/channels/#{channel_id}/thread-members/#{user_id}"
      end

      def get_thread_member(channel_id, user_id, with_member: nil)
        @internet.get "#{@base_url}/channels/#{channel_id}/thread-members/#{user_id}#{params({ with_member: })}"
      end

      def list_thread_members(channel_id, with_member: true, after: nil, limit: nil)
        @internet.get "#{@base_url}/channels/#{channel_id}/thread-members#{params({ with_member:, after:, limit: })}"
      end

      def list_public_archived_threads(channel_id, before: nil, limit: nil)
        @internet.get "#{@base_url}/channels/#{channel_id}/threads/archived/public#{params({ before:, limit: })}"
      end

      def list_private_archived_threads(channel_id, before: nil, limit: nil)
        @internet.get "#{@base_url}/channels/#{channel_id}/threads/archived/private#{params({ before:, limit: })}"
      end

      def list_joined_private_archived_threads(channel_id, before: nil, limit: nil)
        @internet.get "#{@base_url}/channels/#{channel_id}/users/@me/threads/archived/private#{params({ before:,
                                                                                                        limit: })}"
      end
    end
  end
end
