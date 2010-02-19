#set :application, "locarunners"
#set :user, "mauriciodeamorim"

#set :repository,  "git://github.com/mauriciodeamorim/loca_runners.git"

#set :scm, :git
## Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#role :web, "200.234.200.159"                          # Your HTTP server, Apache/etc
#role :app, "200.234.200.159"                          # This may be the same as your `Web` server
#role :db,  "200.234.200.159", :primary => true # This is where Rails migrations will run
##role :db,  "your slave db-server here"

#set :use_sudo, false
#set :deploy_to, "rails_app/#{application}" 
#set :domain, "#{user}@#{application}"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

require "capistrano/version"

load "deploy"

set :application, "locarunners"
set :user, "mauriciodeamorim"
set :use_sudo, false

role :server, "200.234.200.159"
role :app, "200.234.200.159"                          # This may be the same as your `Web` server
#role :db,  "200.234.206.65", :primary => true  # This is where Rails migrations will run

set :deploy_to, "/home/#{user}/rails_app/#{application}"

set :scm, :none

set :deploy_via, "copy"
set :copy_strategy, :export
set :repository, File.join(File.dirname(__FILE__), "..")


namespace :deploy do
  task :start do ; end
  task :stop do ; end 
  task :restart, :roles => :app do
    run "touch #{deploy_to}/current/tmp/restart.txt"
#   run "touch #{deploy_to}/#{File.join(current_path,'tmp','restart.txt')}"
    end
  task :seed do run "cd /home/#{user}/rails_app/#{application}/current && rake db:migrate RAILS_ENV=production && rake db:seed RAILS_ENV=production"; end

  desc "Run this after every successful deployment" 
  task :after_default do
    run "cd /home/#{user}/rails_app/#{application}/current && rake db:migrate RAILS_ENV=production && rake db:seed RAILS_ENV=production"
  end
end
