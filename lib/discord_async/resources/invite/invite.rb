# frozen_string_literal: true

Invite = Data.define(:code, :guild, :channel, :inviter, :target_type, :target_user, :target_application,
                     :approximate_presence_count, :approximate_member_count, :expires_at, :stage_instance, :guild_scheduled_event)
