# frozen_string_literal: true

Connection = Data.define(:id, :name, :type, :revoked, :integrations, :verified, :friend_sync, :show_activity,
                         :two_way_link, :visibility)
