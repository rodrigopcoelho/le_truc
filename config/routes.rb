Rails.application.routes.draw do
  root to: "pages#landing"
  devise_for :users
  get '/homepage' => "products#index", :as => :user_root
  resources :products

  resources :bookings
  get "dashboard", to: "products#dashboard"
end
