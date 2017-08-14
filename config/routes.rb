Rails.application.routes.draw do
  resources :products
  resources :categories
  root "products#index"
end
