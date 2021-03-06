Rails.application.routes.draw do

  root 'user#index'

  get '/user/new' => 'user#new'

  get '/user/index' => 'user#index'

  get '/user/create' => 'user#create'

  get '/user/edit/:id' => 'user#edit'

  get '/user/show/:id' => 'user#show'

  get '/user/update/:id' => 'user#update'

  get '/user/destroy/:id' => 'user#destroy'

  get '/user/add_coment' => 'user#add_coment'

  get '/user/update_coment/:id' => 'user#update_commnet'

  get '/user/edit_commnet/:id' => 'user#edit_commnet'


  get '/member/new' => 'member#new'
  post '/member/create' => 'member#create'
  get '/menber/index' => 'menber#index'

  get '/member/login' => 'member#login'
  get '/member/logout' => 'member#logout'
  post '/member/login_process' => 'member#login_process'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


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
