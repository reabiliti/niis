# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '~> 2.5.1'

gem 'bootstrap'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.0'
gem 'rails-i18n', '~> 5.0.0'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'kaminari'
gem 'pg'
gem 'strong_migrations'
gem 'sorcery'
gem 'validates_email_format_of'

gem 'haml-rails'
gem 'prawn'
gem 'responders'

group :development, :test do
  gem 'pry-rails'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'bullet'
  gem 'capistrano', '~> 3.7', '>= 3.7.1'
  gem 'capistrano-rails', '~> 1.2'
  gem 'capistrano-passenger', '~> 0.2.0'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'haml_lint', require: false
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
