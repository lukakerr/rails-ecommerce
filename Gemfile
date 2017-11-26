source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.2'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'simple_form'
gem 'devise'
gem "paperclip", "~> 5.0.0"
gem 'client_side_validations'
gem 'client_side_validations-simple_form'
gem 'omniauth-facebook'
gem 'will_paginate', '~> 3.1.0'
gem 'summernote-rails', '0.8.3.0'
gem 'bootstrap-sass'
gem 'aws-sdk'
gem 'mail_form'
gem 'jquery-ui-rails'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.6'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
