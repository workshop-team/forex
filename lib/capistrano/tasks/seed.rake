# frozen_string_literal: true

namespace :custom do
  desc 'add seed'
  task :add_seed do
    on roles(:app) do
      within current_path.to_s do
        with rails_env: fetch(:stage).to_s do
          execute :rake, 'db:seed'
        end
      end
    end
  end
end
