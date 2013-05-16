TeamProject::Application.routes.draw do
  root "pages#home"

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    Rails.env.development? || (username == 'admin' && password == ENV['SIDEKIQ_PASSWORD'])
  end
end
