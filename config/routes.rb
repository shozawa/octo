Rails.application.routes.draw do
  devise_for :admin_users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get '/versions/:id/download', to: 'versions#download'
  get 'welcome/index'

  devise_for :users, controllers: {
  registrations: 'users/registrations'}

  resources :users

  resources :projects, only: [:index, :show, :create, :new, :destroy] do
    resources :documents, only: [:index, :show, :create, :new, :destroy], shallow: true
    resources :documents, only: [:index] do
      get '?page=:page', :action => :index, :on => :collection
    end
    resources :project_users
  end

  resources :projects, only: [:edit, :update]

  resources :versions, only: [:create, :show, :destroy] do
      resources :posts, only: [:create, :index, :update, :edit, :destroy], shallow: true
  end

  resources :project_users

  if Rails.env.development?
      mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'welcome#index'
  root 'projects#index'

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
