# frozen_string_literal: true

require 'test_helper'
describe 'Manager' do
  let(:manager) { DiscordAsync::ApplicationCommand::Manager.new }
  let(:command_params) do
    {
      name: :my_name,
      description: 'my description',
      default_member_permissions: '1',
      dm_permission: true
    }
  end

  describe 'chat input command' do
    it 'defines chat input command with name, description, default_member_permissions, dm_permission' do
      command_params = self.command_params.merge(type: 1)

      manager.define_commands do
        chat_input_command command_params[:name], description: command_params[:description] do
          default_member_permissions command_params[:default_member_permissions]
          dm_permission command_params[:dm_permission]
        end
      end.first => command

      command_params.each do |param, value|
        assert command.send(param) == value
      end
    end

    it 'sets correct description thought alies "desc"' do
      my_command_description = 'my desc'

      manager.define_commands do
        chat_input_command :my_command_name, desc: my_command_description
      end.first => command

      assert command.type == 1
      assert command.description == my_command_description
    end

    it 'sets string option' do
      skip
      manager.define_commands do
        chat_input_command :name, desc: 'desc' do
          options do
            sub_command :option_name, desc: 'option desc'
            sub_command_group :option_name, desc: 'option desc'
            string :option_name, desc: 'option desc'
            integer :option_name, desc: 'desc'
            boolean :option_name, desc: 'desc'
            user :option_name, desc: 'desc'
            channel :option_name, desc: 'desc'
            role :option_name, desc: 'desc'
            mentionable :option_name, desc: 'desc'
            number :option_name, desc: 'desc'
            attachment :option_name, desc: 'desc'
            string! :option_name, desc: 'desc'
            integer! :option_name, desc: 'desc'
            boolean! :option_name, desc: 'desc'
            user! :option_name, desc: 'desc'
            channel! :option_name, desc: 'desc'
            role! :option_name, desc: 'desc'
            mentionable! :option_name, desc: 'desc'
            number! :option_name, desc: 'desc'
            attachment! :option_name, desc: 'desc'
          end
        end
      end.first => command

      assert command.options.first.type == 3
    end
  end

  describe 'user command' do
    it 'defines user command with name, description, default_member_permissions, dm_permission' do
      command_params = self.command_params.merge(type: 2)

      manager.define_commands do
        user_command command_params[:name], description: command_params[:description] do
          default_member_permissions command_params[:default_member_permissions]
          dm_permission command_params[:dm_permission]
        end
      end.first => command

      command_params.each do |param, value|
        assert command.send(param) == value
      end
    end

    it 'sets correct description thought alies "desc"' do
      my_command_description = 'my desc'

      manager.define_commands do
        user_command :my_command_name, desc: my_command_description
      end.first => command

      assert command.type == 2
      assert command.description == my_command_description
    end

    it "can't have options" do
      skip
      assert_raises(DiscordAsync::Error::CommandTypeNotSupportOptions) do
        manager.define_commands do
          user_command :name, desc: 'desc' do
            options do
            end
          end
        end
      end
    end
  end

  describe 'message command' do
    it 'defines message command with name, description, default_member_permissions, dm_permission' do
      command_params = self.command_params.merge(type: 3)

      manager.define_commands do
        message_command command_params[:name], description: command_params[:description] do
          default_member_permissions command_params[:default_member_permissions]
          dm_permission command_params[:dm_permission]
        end
      end.first => command

      command_params.each do |param, value|
        assert command.send(param) == value
      end
    end

    it 'sets correct description thought alies "desc"' do
      my_command_description = 'my desc'

      manager.define_commands do
        message_command :my_command_name, desc: my_command_description
      end.first => command

      assert command.type == 3
      assert command.description == my_command_description
    end
  end
end
