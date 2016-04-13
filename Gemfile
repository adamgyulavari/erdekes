source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use sqlite3 as the database for Active Record
#gem 'sqlite3'
gem 'pg'

# Authentication
gem 'devise'
gem 'omniauth'
gem 'omniauth-oauth2', '~> 1.3.1'
gem "omniauth-google-oauth2", :git => 'https://github.com/zquestz/omniauth-google-oauth2', :branch => 'master'

## Basic extension gems
gem 'public_activity'
gem 'will_paginate'
gem 'rails-timeago'
gem 'acts_as_votable'
gem 'acts_as_commentable'
gem 'acts_as_list'
gem 'dragonfly', "~>1.0.5"
gem 'dragonfly-s3_data_store'
gem 'newrelic_rpm'

## Frontend
gem 'jquery-rails'
gem 'haml-rails'
gem 'bootstrap-sass', '~> 3.1.1'
gem 'bootstrap-sass-extras'
gem 'bootflat-rails', '~> 0.1.8'
gem 'formtastic-bootstrap', github: 'ekubal/formtastic-bootstrap'
gem 'rails-i18n', '~> 4.0.0'
gem 'magnific-popup-rails'
gem 'tinymce-rails'
gem 'bootstrap-datetimepicker-rails'

gem "sass-rails", github: 'zakelfassi/sass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'

gem 'bourbon'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'


# Use Unicorn as the app server
gem 'unicorn'
# Use Capistrano for deployment
gem 'capistrano', '~> 3.4.0'

# rails specific capistrano funcitons
gem 'capistrano-rails', '~> 1.1.0'

# integrate bundler with capistrano
gem 'capistrano-bundler'

# if you are using RBENV
gem 'capistrano-rbenv', "~> 2.0"
gem 'capistrano-rails-console'

group :development do
  gem 'better_errors'
  gem 'letter_opener'
  gem 'binding_of_caller'
  gem 'bullet'
end

group :production do
  gem 'rails_12factor'
end
