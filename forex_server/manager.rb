# frozen_string_literal: true

require_relative 'strategy'
require_relative 'sql/commands_sql'

module ForexServer
  class Manager
    def call
      # fetch from database commands like add/remove strategy, sell/buy instrument
      puts '-- Manage trading'
      execute_commands(ForexServer::SqlManager.instance.call(ForexServer::CommandsSql.commands))
    end

    def execute_commands(commands)
      commands.each { |c| send c['name'], c['params'], c['id'] }
    end

    def add_strategy(params, command_id)
      puts '--- Add strategy'

      command_executer(command_id, 'New Strategy added successfully') do
        ForexServer::Strategies.instance.add(JSON.parse(params)['id'])
      end
    end

    def edit_strategy(_params, command_id)
      puts '--- Edit strategy'

      ForexServer::SqlManager.instance.call(ForexServer::CommandsSql.update_execute, [command_id])
    end

    def destroy_strategy(params, command_id)
      puts '--- Destroy strategy'

      command_executer(command_id, 'Strategy deleted successfully') do
        ForexServer::Strategies.instance.delete(JSON.parse(params)['id'])
      end
    end

    def command_executer(command_id, message)
      yield
      ForexServer::SqlManager.instance.call(ForexServer::CommandsSql.update_execute, [command_id])
      ForexServer::Logger.instance.call(message)
    end
  end
end
