Rails.application.routes.draw do
  root to: "pages#landing"
  devise_for :users
  get '/homepage' => "products#index", :as => :user_root
  resources :products
  get "dashboard", to: "products#dashboard"
  get "/404", to: "errors#not_found"
end
