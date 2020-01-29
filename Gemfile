# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '~> 2.6.1'

gem 'bootstrap', '~> 4.3.1'
gem 'coffee-rails', '~> 4.2'
gem 'data_migrate'
gem 'dotenv-rails'
gem 'jquery-rails'
gem 'kaminari'
gem 'pg'
gem 'puma', '~> 3.12'
gem 'rails', '~> 5.2.2'
gem 'rails-i18n', '~> 5.1.3'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'sorcery'
gem 'strong_migrations'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'validates_email_format_of'

gem 'haml-rails'
gem 'prawn'
gem 'wicked_pdf', '~> 1.1.0'
gem 'wkhtmltopdf-binary'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara'
  gem 'pry-rails'
  gem 'selenium-webdriver'
end

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end

group :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 3.9'
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'bullet'
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-passenger'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'haml_lint', require: false
  gem 'listen', '>= 3.0.5', '< 3.3'
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
