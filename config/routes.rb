Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  Product::CATEGORIES.each do |category|
    get "products/#{category}", to: "products##{category}"
  end

  resources :products
end
