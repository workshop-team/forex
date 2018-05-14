# frozen_string_literal: true

require_relative 'strategy'
require_relative 'sql/commands_sql'

module ForexServer
  class Manager
    def call
      # fetch from database commands like add/remove strategy, sell/buy instrument
      puts '-- Manage trading'
      execute_commands(SqlManager.instance.call(CommandsSql.commands))
    end

    def execute_commands(commands)
      commands.each { |c| send c['name'], c['params'], c['id'] }
    end

    def add_strategy(params, command_id)
      puts '--- Add strategy'

      notification = "Strategy >>> #{json(params)['name']} <<< added successfully"
      command_executor(command_id, notification) do
        Strategies.instance.add(json(params)['id'])
      end
    end

    def edit_strategy(_params, command_id)
      puts '--- Edit strategy'

      SqlManager.instance.call(CommandsSql.update_execute, [command_id])
    end

    def destroy_strategy(params, command_id)
      puts '--- Destroy strategy'

      notification = "Strategy >>> #{json(params)['name']} <<< deleted successfully"
      command_executor(command_id, notification, 'alert') do
        Strategies.instance.delete(JSON.parse(params)['id'])
      end
    end

    def update_status(params, command_id)
      puts '--- Update status'

      notification = "Status of strategy >>> #{json(params)['name']} <<< has been changed"
      command_executor(command_id, notification) do
        manage_status(params)
      end
    end

    private

    def manage_status(params)
      strategy = json(params)

      if strategy['status'] == 'activated'
        StrategyLogicProvider.delete(strategy['id'])
        Strategies.instance.add(strategy['id'])
      end

      Strategies.instance.delete(strategy['id']) if strategy['status'] == 'stopped'
    end

    def command_executor(command_id, message, kind = 'info')
      yield
      SqlManager.instance.call(CommandsSql.update_execute, [command_id])
      Logger.call(message, kind)
    end

    def json(params)
      JSON.parse(params)
    end
  end
end
