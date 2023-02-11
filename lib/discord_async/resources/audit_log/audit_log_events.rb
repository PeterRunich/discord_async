# frozen_string_literal: true

require_relative '../../types'

module DiscordAsync
  module Resources
    class AuditLog < Dry::Struct
      AuditLogEvents = Types::Integer.enum(
        1 => :guild_update,
        10 => :channel_create,
        11 => :channel_update,
        12 => :channel_delete,
        13 => :channel_overwrite_create,
        14 => :channel_overwrite_update,
        15 => :channel_overwrite_delete,
        20 => :member_kick,
        21 => :member_prune,
        22 => :member_ban_add,
        23 => :member_ban_remove,
        24 => :member_update,
        25 => :member_role_update,
        26 => :member_move,
        27 => :member_disconnect,
        28 => :bot_add,
        30 => :role_create,
        31 => :role_update,
        32 => :role_delete,
        40 => :invite_create,
        41 => :invite_update,
        42 => :invite_delete,
        50 => :webhook_create,
        51 => :webhook_update,
        52 => :webhook_delete,
        60 => :emoji_create,
        61 => :emoji_update,
        62 => :emoji_delete,
        72 => :message_delete,
        73 => :message_bulk_delete,
        74 => :message_pin,
        75 => :message_unpin,
        80 => :integration_create,
        81 => :integration_update,
        82 => :integration_delete,
        83 => :stage_instance_create,
        84 => :stage_instance_update,
        85 => :stage_instance_delete,
        90 => :sticker_create,
        91 => :sticker_update,
        92 => :sticker_delete,
        100 => :guild_scheduled_event_create,
        101 => :guild_scheduled_event_update,
        102 => :guild_scheduled_event_delete,
        110 => :thread_create,
        111 => :thread_update,
        112 => :THREAD_DELETE,
        121 => :application_command_permission_update,
        140 => :auto_moderation_rule_create,
        141 => :auto_moderation_rule_update,
        142 => :auto_moderation_rule_delete,
        143 => :auto_moderation_block_message,
        144 => :auto_moderation_flag_to_channel,
        145 => :auto_moderation_user_communication_disabled
      )
    end
  end
end
