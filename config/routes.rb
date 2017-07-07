Rails.application.routes.draw do

	devise_for :users, :controllers => {registrations:  'registrations'}

	devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'  
	end
	
	
	root :to => 'home#index'
	get 'home/index'
  get '/index', to: 'home#index'
  get '/about', to: 'home#about'
	get '/schedule', to: 'home#schedule'
	
	resources :reservations
  resources :testlines
end
