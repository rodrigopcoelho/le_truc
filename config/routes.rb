Rails.application.routes.draw do
  root to: "pages#landing"
  devise_for :users
  get '/homepage' => "products#index", :as => :user_root
  resources :products
  resources :bookings

  get "dashboard_admin", to: "products#dashboard"
  get "dashboard_user", to: "bookings#dashboard"
end
