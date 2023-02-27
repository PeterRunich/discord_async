# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Interaction
      module Component
        class SelectMenu < StructBase
          attribute :type,
                    Types.Value(ComponentTypes[:string_select]) |
                    Types.Value(ComponentTypes[:user_select]) |
                    Types.Value(ComponentTypes[:role_select]) |
                    Types.Value(ComponentTypes[:mentionable_select]) |
                    Types.Value(ComponentTypes[:channel_select])
          attribute :custom_id, Types::Coercible::String
          attribute? :options, Types::Array.of(SelectMenu)
          attribute? :channel_types, Types::Array.of(Channel::ChannelTypes)
          attribute? :placeholder, Types::Coercible::String
          attribute? :min_values, Types::Coercible::Integer
          attribute? :max_values, Types::Coercible::Integer
          attribute? :disabled, Types::Bool.default(false)
        end
      end
    end
  end
end
