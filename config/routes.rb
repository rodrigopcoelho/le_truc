Rails.application.routes.draw do
  root to: "pages#landing"
  devise_for :users
  resources :products
  get "dashboard", to: "products#dashboard"
end
