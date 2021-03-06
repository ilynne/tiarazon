Rails.application.routes.draw do
  resources :order_items, only: [:create, :update, :destroy]

  resources :orders, only: [:show, :edit, :index, :create, :update, :destroy]

  devise_for :users
  resources :shops

  resources :products

  resources :users, only: [:index, :edit, :update, :destroy]

  resources :accounts, only: [:index, :show]

  resources :entries, only: [:index, :show]

  scope 'cart' do
    put    'update',                  to: 'orders#update'
    post   'add_order_item',          to: 'order_items#add_to_cart'
    post   'update_order_item/:id',   to: 'order_items#update_in_cart',   as: 'update_cart_order_item'
    delete 'remove_order_item/:id',   to: 'order_items#remove_from_cart', as: 'remove_order_item'
  end

  # resources :accounts, only: [:index, :show]

  # mount Plutus::Engine => "/plutus", :as => "plutus"

  # authenticate :user do
  #   mount Plutus::Engine => "/plutus", layout: 'plutus/application'
  # end

  get "welcome/index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
