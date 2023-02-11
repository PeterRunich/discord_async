# frozen_string_literal: true

module DiscordAsync
  module Resources
    class Channel < Dry::Struct
      class Message < Dry::Struct
        attribute :id, Types::Snowflake
        attribute :channel_id, Types::Snowflake
        attribute :author, User
        attribute :content, Types::Coercible::String
        attribute :timestamp, Types::TimestampISO8601
        attribute :edited_timestamp, Types::TimestampISO8601.optional
        attribute :tts, Types::Bool
        attribute :mention_everyone, Types::Bool
        attribute :mentions, Types::Array.of(User)
        attribute :mention_roles, Types::Array.of(Role)
        attribute? :mention_channels, Types::Array.of(ChannelMention)
        attribute :attachments, Types::Array.of(Attachment)
        attribute :embeds, Types::Array.of(Embed)
        attribute? :reactions, Types::Array.of(Reaction)
        attribute? :nonce, Types::Integer | Types::String
        attribute :pinned, Types::Bool
        attribute? :webhook_id, Types::Snowflake
        attribute :type, MessageTypes
        attribute? :activity, MessageActivity
        attribute? :application, PartialApplication
        attribute? :application_id, Types::Snowflake
        attribute? :message_reference, MessageReference
        attribute? :flags, Types::Coercible::Integer
        attribute? :referenced_message, Message.optional
        attribute? :interaction, Interaction::MessageInteraction
        attribute? :thread, Channel
        # attribute? :components, TODO: complex check Discord doc
        attribute? :sticker_items, Types::Array.of(Sticker::StickerItem)
        attribute? :stickers, Types::Array.of(Sticker)
        attribute? :position, Types::Coercible::Integer
        attribute? :role_subscription_data, RoleSubscriptionDataObject
      end
    end
  end
end
