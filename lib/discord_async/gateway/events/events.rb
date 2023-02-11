# frozen_string_literal: true

require_relative 'interaction_create'
require_relative 'application_command_permissions_update'
require_relative 'auto_moderation_action_execution'
require_relative 'auto_moderation_rule_create'
require_relative 'auto_moderation_rule_delete'
require_relative 'base'
require_relative 'auto_moderation_rule_update'
require_relative 'channel_create'
require_relative 'channel_delete'
require_relative 'channel_pins_update'
require_relative 'channel_update'
require_relative 'guild_audit_log_entry_create'
require_relative 'guild_ban_add'
require_relative 'guild_ban_remove'
require_relative 'guild_create'
require_relative 'guild_delete'
require_relative 'guild_emojis_update'
require_relative 'guild_integrations_update'
require_relative 'guild_member_add'
require_relative 'guild_member_remove'
require_relative 'guild_member_update'
require_relative 'guild_members_chunk'
require_relative 'guild_role_create'
require_relative 'guild_role_delete'
require_relative 'guild_role_update'
require_relative 'guild_scheduled_event_create'
require_relative 'guild_scheduled_event_delete'
require_relative 'guild_scheduled_event_update'
require_relative 'guild_scheduled_event_user_add'
require_relative 'guild_scheduled_event_user_remove'
require_relative 'guild_stickers_update'
require_relative 'guild_update'
require_relative 'hello'
require_relative 'integration_create'
require_relative 'integration_delete'
require_relative 'integration_update'
require_relative 'invalid_session'
require_relative 'invite_create'
require_relative 'invite_delete'
require_relative 'message_create'
require_relative 'message_delete'
require_relative 'message_delete_bulk'
require_relative 'message_reaction_add'
require_relative 'message_reaction_remove'
require_relative 'message_reaction_remove_all'
require_relative 'message_reaction_remove_emoji'
require_relative 'message_update'
require_relative 'presence_update'
require_relative 'ready'
require_relative 'reconnect'
require_relative 'resumed'
require_relative 'stage_instance_create'
require_relative 'stage_instance_delete'
require_relative 'stage_instance_update'
require_relative 'thread_create'
require_relative 'thread_delete'
require_relative 'thread_list_sync'
require_relative 'thread_member_update'
require_relative 'thread_members_update'
require_relative 'thread_update'
require_relative 'typing_start'
require_relative 'user_update'
require_relative 'voice_server_update'
require_relative 'voice_state_update'
require_relative 'webhooks_update'
require_relative 'heartbeat'
require_relative 'identify'
require_relative 'request_guild_members'
require_relative 'resume'
require_relative 'update_presence'
require_relative 'update_voice_state'
require_relative 'heartbeat_ack'

module DiscordAsync
  class Gateway
    module Events
    end
  end
end
