TOERH::Application.routes.draw do

  # Api Routes
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do

      # CORS
      #match '/resources' => 'resources#options', :constraints => {:method => 'OPTIONS'}, via: [:options]

      resources :resources
      #resources :users
      resources :licences
      resources :resource_types
      resources :tags

      resources :users do
        resources :resources
      end

      resources :resource_types do
        resources :resources
      end

      resources :licences do
        resources :resources
      end

      resources :tags do
        resources :resources
      end

      resources :resources do
        resources :tags
      end

    end
  end

  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  get '/auth/github/callback' => 'omni_sessions#create'

  get '/authenticate' => 'omni_sessions#authenticate'

  # Example of regular route
  #   get 'products/:id' => 'catalog#view'
  get "api_keys/index"
  get "reminders/new"
  post 'api_key/signin' => 'sessions#admin_signin', :as => 'admin_signin'
  get 'api_key/signout' => 'sessions#admin_signout', :as => 'admin_signout'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  resources :applications, :controller => "register"
  resources :register
  resources :reminders
  resources :sessions
  resources :api_keys

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
