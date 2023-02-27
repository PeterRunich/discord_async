# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Channel
      MessageTypes = Types::Integer.enum(
        0 => :default,
        1 => :recipient_add,
        2 => :recipient_remove,
        3 => :call,
        4 => :channel_name_change,
        5 => :channel_icon_change,
        6 => :channel_pinned_message,
        7 => :user_join,
        8 => :guild_boost,
        9 => :guild_boost_tier_1,
        10 => :guild_boost_tier_2,
        11 => :guild_boost_tier_3,
        12 => :channel_follow_add,
        14 => :guild_discovery_disqualified,
        15 => :guild_discovery_requalified,
        16 => :guild_discovery_grace_period_initial_warning,
        17 => :guild_discovery_grace_period_final_warning,
        18 => :thread_created,
        19 => :reply,
        20 => :chat_input_command,
        21 => :thread_starter_message,
        22 => :guild_invite_reminder,
        23 => :context_menu_command,
        24 => :auto_moderation_action,
        25 => :role_subscription_purchase,
        26 => :interaction_premium_upsell,
        32 => :guild_application_premium_subscription
      )
    end
  end
end
