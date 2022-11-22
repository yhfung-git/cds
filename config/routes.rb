Rails.application.routes.draw do
  devise_for :users
  root to: "cds#home"

  resources :cds do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, except: %i[new create]
end

# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# Defines the root path route ("/")
# root "articles#index"
