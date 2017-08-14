Rails.application.routes.draw do
	devise_for :users, :controllers => { registrations: 'registrations' }
	resources :products
	resources :categories

	root "products#index"
end
