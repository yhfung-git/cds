Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions" }
  root to: "cds#home"
  devise_scope :user do
     get 'users' => 'users/registrations#show', as: :user
  end
  resources :cds do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, except: %i[new create]
end

# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# Defines the root path route ("/")
# root "articles#index"
