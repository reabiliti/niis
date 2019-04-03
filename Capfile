require 'capistrano/setup'
require 'capistrano/deploy'

require 'capistrano/scm/git'
install_plugin Capistrano::SCM::Git

require 'capistrano/rails'
require 'capistrano/passenger'
require 'capistrano/rbenv'
require 'capistrano/bundler'
set :rbenv_type, :user
set :rbenv_ruby, '2.5.5'

Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
