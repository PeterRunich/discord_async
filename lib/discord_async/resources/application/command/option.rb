# frozen_string_literal: true

module DiscordAsync
  module Resources
    module Application
      module Command
        class Option < StructBase
          attribute :type, OptionTypes
          attribute :name, Types::Coercible::String
          attribute? :name_localization, Types::Hash.optional
          attribute :description, Types::Coercible::String
          attribute? :description_localization, Types::Hash.optional
          attribute? :required, Types::Bool.default(false)
          attribute? :choices, Types::Array.of(OptionChoice)
          attribute? :options, Types::Array.of(Option)
          attribute? :channel_types, Types::Array.of(Channel::ChannelTypes)
          attribute? :min_value, Types::Integer | Types::Float
          attribute? :max_value, Types::Integer | Types::Float
          attribute? :min_length, Types::Coercible::Integer
          attribute? :max_length, Types::Coercible::Integer
          attribute? :autocomplete, Types::Bool
        end
      end
    end
  end
end
