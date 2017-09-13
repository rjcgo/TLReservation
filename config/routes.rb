Rails.application.routes.draw do
  
  root 'home#index'
  
  get 'login' => 'home#login'
  put 'assign_team' => 'user#assign_team', :as => 'assign_team'

  get 'admin' => 'admin#home'
  get 'admin/teams'
  get 'admin/associations'
  get 'admin/testlines'
  get 'admin/users'

  get 'admin/users/:id/assign_team/edit' => 'admin#edit_assigned_team', :as => 'edit_assigned_team'
  put 'admin/users/:id/assign_team' => 'admin#update_assigned_team', :as => 'admin_assign_team'
  put 'admin/users/:id/make_admin' => 'admin#make_admin', :as => 'make_admin'

  get 'reservations' => 'testlines#reservations'
  get 'reservations/download_log_file' => 'reservations#download_log_file'

  get 'testlines/:id/teams/new' => 'testlines#newRel', :as => 'new_testline_teams'
  post 'testlines/:id/teams' => 'testlines#addTeam', :as => 'testline_teams'
  delete 'testlines/:testline_id/teams/:team_id' => 'testlines#removeTeam'

  resources :team_testlines, except: [:index]
  devise_for :users
  resources :teams
  resources :testlines, except: [:index] do
    resources :reservations
    resources :teams
  end
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
