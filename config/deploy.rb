# frozen_string_literal: true

require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'

# set :rvm_path, '/usr/james/.rvm/scripts/rvm'
# set :ruby_version, '3.0.0'

# Repository project
set :application_name, 'fhemig-digepe'
set :domain, '45.178.182.180'
#set :deploy_to, '/root/fhemig-digepe'
set :repository, 'git@github.com:luizapitangueira/fhemig-digepe.git'
set :branch, 'main'
set :user, 'root'
set :port, '22'
set :forward_agent, true
set :rails_env, 'production'

task :remote_environment do
  #invoke :'rvm:use[ruby-3.0.3]'
end

task setup: :remote_environment do
  command %(mkdir -p "/root/fhemig-digepe/shared/log")
  command %(chmod g+rx,u+rwx "/root/fhemig-digepe/shared/log")

  command %(mkdir -p "/root/fhemig-digepe/storage")
  command %(chmod g+rx,u+rwx "/root/fhemig-digepe/storage")

  command %(touch "/root/fhemig-digepe/storage/index.html")

  command %(mkdir -p "/root/fhemig-digepe/shared/config")
  command %(chmod g+rx,u+rwx "/root/fhemig-digepe/shared/config")

  command %(mkdir -p "/root/fhemig-digepe/shared/pids")
  command %(chmod g+rx,u+rwx "/root/fhemig-digepe/shared/pids")

  command %(mkdir -p "/root/fhemig-digepe/shared/tmp")
  command %(chmod g+rx,u+rwx "/root/fhemig-digepe/shared/tmp")

  command %(touch "/root/fhemig-digepe/shared/config/database.yml")
  command  %(echo "-----> Be sure to edit 'shared/config/database.yml'.")

  command %(touch "/root/fhemig-digepe/shared/config/application.yml")
  command  %(echo "-----> Be sure to edit 'shared/config/application.yml'.")

  command %(touch "/root/fhemig-digepe/shared/config/secrets.yml")
  command  %(echo "-----> Be sure to edit 'shared/config/secrets.yml'.")
end

desc 'Deploys the current version to the server.'
task deploy: :remote_environment do
  deploy do

    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'deploy:cleanup'  

    on :launch do
      command %(echo -n '-----> Creating new restart.txt: ')
      command "touch /root/fhemig-digepe/shared/tmp/restart.txt"
    end
  end
end

# Server Production
task :production do
  set :rails_env, 'production'
  set :user, 'root'
  set :domain, '45.178.182.180'
  set :deploy_to, '/root/fhemig-digepe'
  set :branch, 'main'
end

# Server staging
task :staging do
  set :rails_env, 'staging'
  set :user, 'staging'
  set :domain, '34.214.28.153'
  set :deploy_to, '/home/staging/procstudio_api'
  set :branch, 'master'
end

# Fix
set :term_mode, nil

set :shared_paths, ['public/uploads', 'config/database.yml', 'log', 'tmp', 'config/application.yml', 'config/secrets.yml']

# Show logs
desc 'Show logs rails.'
task 'logs:rails': :remote_environment do
  command 'echo "Contents of the log file are as follows:"'
  command "tail -f /root/fhemig-digepe/shared/log/production.log"
end

desc 'Show logs Nginx.'
task 'logs:nginx': :remote_environment do
  command 'echo "Contents of the log file are as follows:"'
  command 'tail -f /opt/nginx/logs/error.log'
end

# Roolback
desc 'Rolls back the latest release'
task rollback: :remote_environment do
  command %(echo "-----> Rolling back to previous release for instance: #{domain}")

  # Delete existing sym link and create a new symlink pointing to the previous release
  command %(echo -n "-----> Creating new symlink from the previous release: ")
  command %(ls "/root/fhemig-digepe/releases" -Art | sort | tail -n 2 | head -n 1)
  command %(ls -Art "/root/fhemig-digepe/releases" | sort | tail -n 2 | head -n 1 | xargs -I active ln -nfs "/root/fhemig-digepe/releases/active" "/root/fhemig-digepe/current")

  # Remove latest release folder (active release)
  command %(echo -n "-----> Deleting active release: ")
  command %(ls "/root/fhemig-digepe/releases" -Art | sort | tail -n 1)
  command %(ls "/root/fhemig-digepe/releases" -Art | sort | tail -n 1 | xargs -I active rm -rf "/root/fhemig-digepe/releases/active")

  command %(echo -n "-----> Creating new restart.txt: ")
  command "touch /root/fhemig-digepe/shared/tmp/restart.txt"
end

# Maintenance
# TornOff (Necessary gem https://github.com/biola/turnout)
desc 'TurnOff'
task 'system:turnoff': :remote_environment do
  command %(echo -n "-----> Turn Off System: ")
  command %(cd "/root/fhemig-digepe/current")
  command "RAILS_ENV=#{rails_env} bundle exec rake maintenance:start"
end

desc 'TurnOn'
task 'system:turnon': :remote_environment do
  command %(echo -n "-----> Turn Off System: ")
  command %(cd "/root/fhemig-digepe/current")
  command "RAILS_ENV=#{rails_env} bundle exec rake maintenance:end"
end
