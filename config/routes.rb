TeamProject::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root "pages#home"

  get 'pages/activity'
  get 'pages/dashboard'
  get 'pages/dashboard_goals'
  get 'pages/dashboard_company'
  get 'pages/dashboard_employees'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    Rails.env.development? || (username == 'admin' && password == ENV['SIDEKIQ_PASSWORD'])
  end
end
