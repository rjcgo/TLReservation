Rails.application.routes.draw do

	devise_for :users

	devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'  
	end
	
	match ':controller(/:action)', :via => :get
	
	root :to => 'home#index'
	get 'home/index'
  get '/index', to: 'home#index'
  get '/about', to: 'home#about'
	get '/schedule', to: 'home#schedule'
	
	resources :reservations
  resources :testlines
end
