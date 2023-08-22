Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
<<<<<<< HEAD

=======
  # tirar se der conflito
>>>>>>> products-index
  resources :products
end
