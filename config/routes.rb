Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  resources :bookmarks
  root 'bookmarks#index'

  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end

  namespace :api do
    resources :users
    resources :bookmarks, only: %i[index]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
