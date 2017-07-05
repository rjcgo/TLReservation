Rails.application.routes.draw do


	match ':controller(/:action)', :via => :get

	root :to => 'home#index'
	get 'home/index'

	# resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
