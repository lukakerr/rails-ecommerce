Rails.application.routes.draw do
	resources :products
	resources :categories

	root "products#home"

  # devise_for :users, :controllers => { registrations: 'registrations' }

  devise_for :users, 
  	path: "", 
  	controllers: { registrations: 'registrations' }, 
  	path_names: { sign_in: 'login', password: 'forgot', confirmation: 'confirm', unlock: 'unlock', sign_up: 'register', sign_out: 'logout'}
end
