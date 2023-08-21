Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # tirar se der conflito
  resources :products
end
