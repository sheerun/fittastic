source 'https://rubygems.org'

gem 'rails', '4.0.0.rc1'

# Database
gem 'sqlite3'

# Back-end
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'sidekiq'
gem 'sinatra', :require => nil # Backend for sidekiq
gem 'devise', '>= 3.0.0.rc'

# Front-end
gem 'slim', '~> 1.3.8'
gem 'sass-rails', '~> 4.0.0.rc1'
gem 'bootstrap-sass'
gem 'autoprefixer-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'turbolinks'
gem 'simple_form'
gem 'slim-rails'

# Assets
gem 'jquery-rails'
gem 'rails-timeago', '~> 2.0'

# API
gem 'jbuilder', '~> 1.0.1'

gem 'yajl-ruby'
gem 'quiet_assets', '>= 1.0.2'
gem 'lograge'
gem 'logstash-event'

group :development do
  gem 'coffee-rails-source-maps'
  gem 'rails_best_practices'
  gem 'letter_opener'
  gem 'commands'
end

group :development, :test do
  gem 'debugger'
  gem 'pry'
  gem 'thin'
end

group :production do
  gem 'pg'
  gem 'unicorn'
end
