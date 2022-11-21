Rails.application.routes.draw do
  devise_for :users
  root to: "cds#home"
  resources :cds, except: %i[index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

# class ChangeColumnsToDate < ActiveRecord::Migration[7.0]
#   def change
#     change_column :bookings, :start_time, :datetime
#     change_column :bookings, :end_time, :datetime
#   end
# end
