source 'https://rubygems.org'
ruby '1.9.3'

gem 'rails', '4.0.0.rc1'

# Back-end
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'sidekiq'
gem 'sinatra', :require => nil # Backend for sidekiq
gem 'devise', '>= 3.0.0.rc'
gem 'omniauth'
gem 'omniauth-facebook', '1.4.0'
gem 'decent_exposure'

# Front-end
gem 'slim', '~> 1.3.8'
gem 'sass-rails', '~> 4.0.0.rc1'
gem 'bootstrap-sass-rails'
gem 'bootstrap-sass'
gem 'autoprefixer-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'turbolinks'
gem 'simple_form'
gem 'slim-rails'
gem 'rails-i18n'

# Assets
gem 'jquery-rails'
gem 'rails-timeago', '~> 2.0'

# API
gem 'jbuilder', '~> 1.0.1'
gem 'httparty'
gem 'nokogiri'

gem 'yajl-ruby'
gem 'quiet_assets', '>= 1.0.2'
gem 'lograge'
gem 'logstash-event'

group :development do
  gem 'coffee-rails-source-maps'
  gem 'rails_best_practices'
  gem 'letter_opener'
  gem 'commands'
  gem 'guard'
  gem 'guard-rails'
  gem 'guard-ctags-bundler'
  gem 'rb-fsevent', '~> 0.9.1'
  gem "rails-erd"
end

group :development, :test do
  gem 'sqlite3'
  gem 'debugger'
  gem 'pry'
  gem 'thin'
  gem 'dotenv-rails'
end

group :production do
  gem 'pg'
  gem 'unicorn'
end
