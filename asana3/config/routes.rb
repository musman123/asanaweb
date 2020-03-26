Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]  
  get 'signup', to: 'users#new', as: 'signup'  
  get 'login', to: 'sessions#new', as: 'login'  
  get 'logout', to: 'sessions#destroy', as: 'logout'  
  get 'projects', to: 'projects#index', as: 'projects'  
  get 'users', to: 'users#index', as: 'users' 
  get 'tasks', to: 'tasks#index', as: 'tasks' 
  get 'comments', to: 'comments#index', as: 'comments'
  # post '/ausers', to: 'ausers#create', as: 'create_auser_path'
  get 'showoff', to: 'task#show', as: 'show' 
  get 'select', to: 'ausers#new', as: 'select'
  # get 'selecteduser', to: 'ausers#index', as: 'selecteduser'
  get '/selecteduser', to: 'users#selected', as: 'selecteduser'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  # post '/selecteduser', to: 'user#selection', as: 'selecteduser'
  # post 'selects', to: 'ausers#create', as: 'selects' 
  resources :pictures, only: [:new, :create, :index, :destroy]
  resources :ausers
  resources :users   
  resources :projects do 
    resources :tasks
  end
  resources :users do 
    resources :tasks
  end
  resources :tasks do
    resources :comments
  end
  get 'tasks/index' 
  root 'tasks#index'  
 # get 'sessions/new'

  #get 'sessions/create'

  #get 'sessions/destroy'

  #resources :users
  #get 'signup', to: 'users#new', as: 'signup'  
  #get 'login', to: 'login#checker', as: 'login'  
  #post '/login/dashboard', to: 'login#dashboard', as: 'dashboard' 
  #root 'users#index'  
  
  # get 'login' => 'users#login'
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
