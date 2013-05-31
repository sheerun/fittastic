TeamProject::Application.routes.draw do

  root to: "pages#home"

  devise_for :users, :controllers => { 
    :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :teams, only: [:show, :update, :edit] do
    resource :campaign, only: [:update]
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    Rails.env.development? || (username == 'admin' && password == ENV['SIDEKIQ_PASSWORD'])
  end
end
