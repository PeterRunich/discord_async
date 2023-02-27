# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Invite
      class StageInstance < StructBase
        attribute :members, Types::Array.of(Guild::PartialMember)
        attribute :participant_count, Types::Coercible::Integer
        attribute :speaker_count, Types::Coercible::Integer
        attribute :topic, Types::Coercible::String
      end
    end
  end
end
