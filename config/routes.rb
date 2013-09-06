TeamProject::Application.routes.draw do

  root to: "pages#home"

  devise_for :users, :controllers => { 
    :omniauth_callbacks => "users/omniauth_callbacks",
    :sessions => "users/sessions",
    :registrations => "users/registrations"
  }

  resources :teams, only: [:show, :update, :edit] do
    resource :campaign, only: [:update]
    resources :users, only: [:show, :destroy] do
      resources :activities, only: [:create, :destroy]
    end
  end

  resources :activities, :only => :show do
    member do
      get :upvote
    end
  end

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    Rails.env.development? || (username == 'admin' && password == ENV['SIDEKIQ_PASSWORD'])
  end
end
