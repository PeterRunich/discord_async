# frozen_string_literal: true

require 'dry-types'

require 'dry-validation'

module DiscordAsync
  module ApplicationCommand
    module Type
      include Dry.Types

      def NameConvension(value)
        case value
        when String then value
        when Symbol then value.to_s
        else
          raise TypeError, 'Cannot convert to name'
        end
      end

      Name = Type.Constructor(Object) { |v| NameConvension v }

      CommandType = Integer.enum(1 => :chat_input, 2 => :user, 3 => :message)
      CommandOptionType = Integer.enum(1 => :sub_command, 2 => :sub_command_group, 3 => :string, 4 => :integer,
                                       5 => :boolean, 6 => :user, 7 => :channel, 8 => :role, 9 => :mentionable, 10 => :number, 11 => :attachment)
      ChannelType = Integer.enum(0 => :guild_text, 1 => :dm, 2 => :guild_voice, 3 => :group_dm, 4 => :guild_category,
                                 5 => :guild_announcement, 10 => :announcement_thread, 11 => :public_thread, 12 => :private_thread, 13 => :guild_stage_voice, 14 => :guild_directory, 15 => :guild_forum)

      class CommandOptionChoice < Dry::Struct
        transform_keys(&:to_sym)

        attribute :name, Type::String | Type::Symbol
        attribute? :name_localization, Type::Hash.optional
        attribute :value, Type::Integer | Type::Float | Type::String
      end

      class CommandOption < Dry::Struct
        transform_keys(&:to_sym)

        attribute :type, Type::Integer
        # attribute :name, Type::String | Type::Symbol
        # attribute? :name_localization, Type::Hash.optional
        # attribute :description, Type::String.default("".freeze)
        # attribute? :description_localization, Type::Hash.optional
        # attribute? :required, Type::Bool.default(false)
        # attribute? :choices, Type::Array.of(CommandOptionChoice)
        # attribute? :options, Type::Array.of(Type::CommandOption)
        # attribute? :channel_types, Type::Array.of(ChannelType)
        # attribute? :min_value, Type::Integer | Type::Float
        # attribute? :max_value, Type::Integer | Type::Float
        # attribute? :min_length, Type::Integer
        # attribute? :max_length, Type::Integer
        # attribute? :autocomplete, Type::Bool
      end

      class CommandBase < Dry::Struct
        transform_keys(&:to_sym)

        attribute :name, Type::String | Type::Symbol
        attribute? :name_localization, Type::Hash.optional
        attribute :description, Type::String.default('')
        attribute? :description_localization, Type::Hash.optional
        attribute? :options, Type::Array.of(CommandOption)
        attribute? :default_member_permissions, Type::String.optional
        attribute? :dm_permission, Type::Bool.default(true)
        attribute? :type, Type::CommandType
      end

      class Command < CommandBase
        attribute :id, Type::String
        attribute :application_id, Type::String
        attribute? :guild_id, Type::Integer
        attribute :version, Type::String
      end
    end

    module Factory
      class Command
        attr_reader :commands

        def initialize = @commands = []

        Type::CommandType.mapping.each_value do |type|
          define_method :"#{type}_command" do |name, **kwargs, &block|
            @commands << CleanRoom::Command.new(type, name, **kwargs).tap do |cmd|
              cmd.instance_eval(&block) if block
            end
          end
        end
      end

      class CommandOption
        attr_reader :command_options

        def initialize = @command_options = []

        Type::CommandOptionType.mapping.each_value do |type|
          define_method type do |name, **kwargs, &block|
            @command_options << CleanRoom::CommandOption.new(type, name, **kwargs).tap do |cmd|
              cmd.instance_eval(&block) if block
            end
          end

          define_method :"#{type}!" do |name, **kwargs, &block|
            type.to_proc.call(self, name, **kwargs.merge(required: true), &block)
          end
        end
      end
    end

    module CleanRoom
      class Command
        extend Util::DSLAttribute
        dsl_attr :guild_id, :description, :default_member_permissions, :dm_permission

        def initialize(type, name, **kwargs)
          @type = Type::CommandType[type]
          @name = name

          guild_id kwargs[:for_guild] || kwargs[:guild_id]
          description kwargs[:description] || kwargs[:desc]
          default_member_permissions kwargs[:default_member_permissions]
          dm_permission kwargs[:dm_permission]
        end

        def options(&block)
          @options = Factory::CommandOption.new.tap do |obj|
            obj.instance_eval(&block)
          end.command_options
        end

        def to_hash
          instance_variables.each_with_object({}) do |var, hash|
            hash[var.to_s.delete('@')] = instance_variable_get(var)
          end.compact
        end

        alias desc description
        alias for_guild guild_id
      end

      class CommandOption
        extend Util::DSLAttribute
        dsl_attr :description, :required, :channel_types, :min_value, :max_value, :min_length, :max_length,
                 :autocomplete

        def initialize(type, name, **kwargs)
          @type = Type::CommandOptionType[type]
          @name = name

          description kwargs[:description] || kwargs[:desc]

          %i[required choices channel_types min_value max_value min_length max_length autocomplete].each do |attr|
            attr.to_proc.call self, kwargs[attr]
          end
        end

        def options(&block)
          @options = Factory::CommandOption.new.tap do |obj|
            obj.instance_eval(&block)
          end.command_options
        end

        def choices(value)
          @choices = value&.map { |arr| { name: arr[0], value: arr[1] } }
        end

        def to_hash
          instance_variables.each_with_object({}) do |var, hash|
            hash[var.to_s.delete('@')] = instance_variable_get(var)
          end.compact
        end

        alias desc description
      end
    end

    class CommandBaseContract < Dry::Validation::Contract
      schema do
        required(:type).filled Type::CommandType
        required(:name).filled Type::Name
        required(:description).filled Type::String.default('')
        # optional(:options).filled Type::Array.of(Type::CommandOption)
        optional(:default_member_permissions).maybe Type::String
        optional(:dm_permission).maybe Type::Bool.default(true)

        # rule(:options) do
        #   key.failure("Command with type: #{values[:type]}, not support options") unless values[:type] == Type::CommandType[:chat_input]
        # end
      end
    end

    class Manager
      def define_commands(&block)
        Factory::Command.new.tap do |obj|
          obj.instance_eval(&block)
        end.commands => commands

        commands.map { |cmd| Type::CommandBase.new(cmd) }
      end
    end
  end
end
