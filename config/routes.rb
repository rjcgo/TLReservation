Rails.application.routes.draw do
  get 'reservations/new'

  get 'reservations/edit'

  get 'reservations/index'

  get 'reservations/show'

  get 'testlines/index'

  get 'testlines/new'

  get 'testlines/edit'

  get 'testlines/show'

	devise_for :users, controllers: { registrations: "registrations" }
	match ':controller(/:action)', :via => :get

	root :to => 'home#index'
	get 'home/index'
	get '/schedule', to: 'home#schedule'
	# resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
