Rails.application.routes.draw do
	resources :products
	resources :categories
	resources :banners

	get 'all-banners', to: 'banners#display'

	root "banners#index"

	get '/about', to: 'pages#about'
	get '/contact', to: 'pages#contact'

  devise_for :users,
  	path: "", 
  	controllers: { registrations: 'registrations' }, 
  	path_names: { sign_in: 'login', password: 'forgot', confirmation: 'confirm', unlock: 'unlock', sign_up: 'register', sign_out: 'logout' }

end
