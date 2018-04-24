# frozen_string_literal: true

namespace :custom do
  desc 'start Forex Server'
  task :start_forex_server do
    on roles(:app) do
      within current_path.to_s do
        with rails_env: fetch(:stage).to_s do
          execute :ruby, 'forex_server/forex_daemon.rb start'
        end
      end
    end
  end

  desc 'stop Forex Server'
  task :stop_forex_server do
    on roles(:app) do
      within current_path.to_s do
        with rails_env: fetch(:stage).to_s do
          execute :ruby, 'forex_server/forex_daemon.rb stop'
        end
      end
    end
  end
end
