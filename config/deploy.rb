# config valid for current version and patch releases of Capistrano
lock "~> 3.10.2"

set :application, "redmine"
set :repo_url, "git@github.com:notder/redmine.git"

set :default_stage, "production"

set :user, "deploy"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :branch, ENV['BRANCH'] || 'feature/deploy'

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/srv/www/apps/redmine"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/unicorn.rb','config/database.yml', 'config/configuration.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "cookie", "files"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.4.2'

# set :rvm_type, :system              # Defaults to: :auto
# set :rvm_ruby_version, '2.5.0p0'      # Defaults to: 'default'

set :rails_env, 'production'

set :unicorn_bundle, nil
set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, "config/unicorn.rb"
set :unicorn_rack_env, 'production' # "development", "deployment", or "none"