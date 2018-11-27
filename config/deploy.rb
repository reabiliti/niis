# config valid for current version and patch releases of Capistrano
lock '~> 3.11.0'

set :application, 'niis'
set :repo_url, 'https://github.com/reabiliti/certification.git'

ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :deploy_to, '/home/deploy/apps/niis'
append :linked_files, 'config/database.yml', 'config/master.key', '.env.production'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads'

namespace :deploy do
  task :seed do
    on primary fetch(:migration_role) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'db:seed'
        end
      end
    end
  end

  task :data do
    on primary fetch(:migration_role) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'data:migrate'
        end
      end
    end
  end
end
