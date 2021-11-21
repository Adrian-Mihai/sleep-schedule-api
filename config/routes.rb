Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/version', to: 'application#version'

  namespace :api do
    namespace :v1 do
      resources :users, only: %i[show create update] do
        resources :activities, only: :create
        resources :sleep_sessions, only: :index
        resources :activity_sessions, only: :index
      end
    end
  end
end
