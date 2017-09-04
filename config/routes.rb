Rails.application.routes.draw do
  # get 'order_items/create'

  # get 'order_items/update'

  # get 'order_items/destroy'

  # get 'carts/show'

	resources :products
	resources :categories
	resources :banners
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :orders, except: [:edit, :update, :destroy]
  resources :checkouts, except: [:edit, :update, :destroy]

	get 'all-banners', to: 'banners#display'

	root "banners#index"

	get '/about', to: 'pages#about'
	get '/contact', to: 'pages#contact'

  devise_for :users,
  	path: "", 
  	controllers: { registrations: 'registrations' }, 
  	path_names: { sign_in: 'login', password: 'forgot', confirmation: 'confirm', unlock: 'unlock', sign_up: 'register', sign_out: 'logout' }

end
