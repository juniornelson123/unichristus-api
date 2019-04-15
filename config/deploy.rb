require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'
require 'mina/puma'

set :application_name, 'unichristus'
set :domain, '165.227.103.30'
set :deploy_to, "/var/www/unichristus"
set :repository, 'git@github.com:juniornelson123/unichristus-api.git'
set :branch, 'master'
set :user, 'deploy'
set :forward_agent, true
set :keep_releases, 3

set :unicorn_pid, "/var/www/unichristus/shared/pids/unicorn.pid"
# set :sidekiq_pid, "#{deploy_to}/#{shared_path}/tmp/pids/sidekiq.pid"

# set :rvm_use_path, '/usr/local/rvm/scripts/rvm'
# set :sidekiq_pid, "#{fetch(:shared_path)}/tmp/pids/sidekiq.pid"

# set :shared_dirs, fetch(:shared_dirs, []).push('log', 'tmp', 'node_modules', 'public/uploads', 'pids', 'sockets')
# set :shared_files, fetch(:shared_files, []).push('config/database.yml', 'config/secrets.yml')
# set :shared_paths, ['tmp/sockets', 'tmp/pids']

set :shared_paths, ['config/database.yml', 'config/secrets.yml', 'log', 'tmp', 'node_modules', 'public/assets','public/uploads', 'public/packs']


task :environment do
  # invoke :'rvm:use[ruby-2.4.1@default]'
  command %{source ~/.rvm/scripts/rvm}
  # invoke :'rvm:use', 'ruby-2.4.1@default'
end

task :setup do
  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/log"]

  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/tmp/pids"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/tmp/pids"]

  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/node_modules"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/node_modules"]

  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/tmp/sockets"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/tmp/sockets"]

  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/config"]

  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/public/packs"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/public/packs"]

  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/public/uploads"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/public/uploads"]

  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/public/assets"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/public/assets"]

  queue! %[touch "#{deploy_to}/#{shared_path}/config/database.yml"]
  queue! %[touch "#{deploy_to}/#{shared_path}/config/secrets.yml"]
  queue  %[echo "-----> Be sure to edit '#{deploy_to}/#{shared_path}/config/database.yml' and 'secrets.yml'."]

  if repository
    repo_host = repository.split(%r{@|://}).last.split(%r{:|\/}).first
    repo_port = /:([0-9]+)/.match(repository) && /:([0-9]+)/.match(repository)[1] || '22'

    queue %[
      if ! ssh-keygen -H  -F #{repo_host} &>/dev/null; then
        ssh-keyscan -t rsa -p #{repo_port} -H #{repo_host} >> ~/.ssh/known_hosts
      fi
    ]
  end
end


desc "reset db"
task :reset => :environment do
  command "cd /var/www/unichristus/current"
  command "bundle exec rake db:reset RAILS_ENV=production"
end

desc "Seed data to the database"
task :seed => :environment do
  command "cd /var/www/unichristus/current"
  command "bundle exec rake db:seed RAILS_ENV=production"
end


desc 'Compile assets with webpack'
task webpack: :environment do
  # command %{yarn install}
  # command %{NODE_ENV=production RAILS_ENV=production bundle exec rails webpacker:compile}
  command "bundle exec rails webpacker:compile RAILS_ENV=production"
  # command %{bundle exec rails webpacker:compile}
  # command 'bundle exec rails webpacker:compile RAILS_ENV=production'
end

# kill -9 $(cat /var/run/unichristus-staging/unicorn.pid)
task bundle_custom: :environment do
  # queue "cd #{deploy_to}/current"
  command %[mkdir -p "/var/www/unichristus/shared/bundle"]
  command %[mkdir -p "./vendor"]
  command %[ln -s "/var/www/unichristus/shared/bundle" "/var/www/unichristus/shared/vendor/bundle"]

  command "bundle install"

end


desc "Deploys the current version to the server."
task :deploy => :environment do
  # to :before_hook do
    # Put things to run locally before ssh
  # end
  # uncomment this line to make sure you pushed your local branch to the remote origin
  # invoke :'git:ensure_pushed'
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    # invoke :'sidekiq:quiet'
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    # invoke :'bundle_custom'
    invoke :'rails:db_migrate'
    # invoke :'rails:assets_precompile:force'
    # invoke :'webpacker:compile'
    # invoke :'webpack'
    # invoke :'deploy:cleanup'
    # invoke :clean


    to :launch do
      invoke :'puma:hard_restart'
      # invoke :'sidekiq:restart'
    end
  end

  # you can use `run :local` to run tasks on local machine before of after the deploy scripts
  # run(:local){ say 'done' }
end
