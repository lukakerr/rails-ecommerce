Rails.application.routes.draw do
  resources :products
  resources :categories
  resources :banners
  resources :contacts, only: [:new, :create]
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :orders, except: [:edit, :update, :destroy]
  resources :checkouts, except: [:edit, :update, :destroy], param: :slug
  
  resources :pages, param: :slug do 
    collection { post :sort }
  end

  get 'all-banners', to: 'banners#display'
  post 'uploads' => 'uploads#create'

  root "banners#index"
  
  devise_for :users,
    path: "", 
    controllers: { 
      registrations: 'registrations', 
      :omniauth_callbacks => "users/omniauth_callbacks" 
    },
    path_names: { 
      sign_in: 'login', 
      password: 'forgot', 
      confirmation: 'confirm', 
      unlock: 'unlock', 
      sign_up: 'register', 
      sign_out: 'logout' 
    }
end
