Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/version', to: 'application#version'

  namespace :api do
    namespace :v1 do
      post '/import', to: 'import#import'
    end
  end
end
