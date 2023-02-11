# frozen_string_literal: true

GuildPreview = Data.define(:id, :name, :icon, :splash, :discovery_splash, :emojis, :features,
                           :approximate_member_count, :approximate_presence_count, :description, :stickers)
