Sample::Application.routes.draw do
  resources :categories


  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  #devise_for :users
 resources :reviews
 # devise_for :users, :path_names => {:sign_up => "register"}, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
devise_for :users, :controllers => { :omniauth_callbacks =>"users/omniauth_callbacks" }

 devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}
#devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
# devise_scope :user do
#     get '/users/auth/:provider/upgrade' => 'omniauth_callbacks#upgrade', as: :user_omniauth_upgrade
#     get '/users/auth/:provider/setup', :to => 'omniauth_callbacks#setup'
#   end
  resources :articles


  resources :products do 

  resources :reviews
end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => 'products#index'
get '/pro', to: 'categories#pro'
  post '/pro', to: 'categories#pro'
  get '/click', to: 'categories#click'
  post '/click', to: 'categories#click'
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

end
