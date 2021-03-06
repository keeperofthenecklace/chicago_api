Rails.application.routes.draw do

  devise_for :users, only: []

  # Add the namespace here
  namespace :v1, defaults: { format: :json } do
    resource :login, only: [:create], controller: :sessions
    resources :users, only: [:index, :create, :show]
    resources :events, only: [:index, :show, :create]
  end
end
