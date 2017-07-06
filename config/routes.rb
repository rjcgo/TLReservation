Rails.application.routes.draw do
  
  resources :reservations
  resources :testlines
	devise_for :users, controllers: { registrations: "registrations" }
	match ':controller(/:action)', :via => :get
	
	root :to => 'home#index'
	get 'home/index'
  get '/index', to: 'home#index'
	get '/schedule', to: 'home#schedule'

end
