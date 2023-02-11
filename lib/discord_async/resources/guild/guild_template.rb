# frozen_string_literal: true

GuildTemplate = Data.define(:code, :name, :description, :usage_count, :creator_id, :creator, :created_at, :updated_at,
                            :source_guild_id, :serialized_source_guild, :is_dirty)
