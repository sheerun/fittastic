source 'https://rubygems.org'
ruby "2.0.0"

gem 'rails', '4.0.0'

gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'

# Back-end
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'sidekiq'
gem 'sinatra', :require => nil # Backend for sidekiq
gem 'omniauth'
gem 'omniauth-facebook', '1.4.0'
gem 'decent_exposure'
gem 'cancan'

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
gem 'nip'

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

gem 'devise',              github: 'plataformatec/devise',     branch: 'rails4'
gem 'responders',          github: 'plataformatec/responders'
gem 'inherited_resources', github: 'josevalim/inherited_resources'
gem 'ransack',             github: 'ernie/ransack',            branch: 'rails-4'

group :development do
  gem 'sqlite3'
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
  gem 'debugger'
  gem 'pry'
  gem 'thin'
  gem 'dotenv-rails'
  gem 'sqlite3'
end

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
  gem 'pg'
end
