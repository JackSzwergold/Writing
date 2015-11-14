# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'writing'
set :short_name, 'writing'
set :repo_url, 'git@github.com:JackSzwergold/Writing.git'

# Set the 'deploy_to' directory.
set :deploy_to, '/var/www'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
set :pty, false

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 3

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  # Remove repository cruft from the deployment.
  desc "Remove cruft from the deployment."
  task :remove_cruft do
    on roles(:app) do

        # Remove any README file that ends in '.md' or '.txt'.
        execute "cd #{current_path} && rm -f README*.{md,txt}"

        # Remove the Capisrano related files and directories.
        execute "cd #{current_path} && rm -rf config && rm -f Capfile"

        # Remove the 'htaccess.txt' file.
        execute "cd #{current_path} && rm -f htaccess.txt"

        # Remove the 'LICENSE.txt' file.
        execute "cd #{current_path} && rm -f LICENSE.txt"

    end
  end

end

after "deploy:finishing", "deploy:remove_cruft"
