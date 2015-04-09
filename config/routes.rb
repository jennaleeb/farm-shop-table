Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"
  get 'home/index'

  get 'make_shopping_list/:id' => 'recipes#generate_shopping_list'
  get 'mark_shopping_list_item_done/:id' => 'shopping_list_items#mark_complete'

  get 'add_to_favourites/:id' => 'recipes#add_to_favourites'
  get 'remove_from_favourites/:id' => 'recipes#remove_from_favourites'

  resources :shopping_list_items
  resources :shopping_lists
  resources :recipe_ingredient_quantities
  resources :ingredient_types
  resources :ingredients
  resources :recipes

  resources :ingredient_availabilities
  resources :user_favourite_recipes
  resources :diet_ingredient_types
  resources :diets
  resources :dietary_preferences
  resources :profiles

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
