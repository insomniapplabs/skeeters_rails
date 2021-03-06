# config valid only for Capistrano 3.1
# lock '3.1.0'

set :application, 'skeetersbc'

set :repo_url, 'https://aaronjohnsonco:h0lein0ne@github.com/aaronjohnsonco/skeeters_rails.git'

set :repo_url, 'https://aaronjohnsonco:h0lein0ne@github.com/aaronjohnsonco/skeeters_rails.git'


set :deploy_to, '/home/deployer/skeetersbc'

# set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5


#namespace :figaro do

#namespace :figaro do

#   desc "Transfer Figaro's application.yml to shared/config"
#   task :upload do
#     on roles(:all) do
#       upload! "config/application.yml", "#{shared_path}/config/application.yml"
#     end
#   end
# end
# before "deploy:check", "figaro:upload"

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end
