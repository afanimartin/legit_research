lock "~> 3.18.0"

set :application, 'legit'
set :repo_url, 'git://github.com:afanimartin/legit_research.git'

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/deploy/legit'

# Default value for :linked_files is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'tmp/webpacker', 'vendor', '.bundle', 'public/system', 'public/uploads', 'storage'

# Only keep the last 5 releases to save disk space
set :keep_releases, 5


namespace :deploy do
  desc "Run db seed"
  task :seed do
    on roles(:all) do
      within current_path do
        execute :bundle, :exec, 'rails', 'db:seed', 'RAILS_ENV=production'
      end
    end
  end
 
  after :migrating, :seed
end