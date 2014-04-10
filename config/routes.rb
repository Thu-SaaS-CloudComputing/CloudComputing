CloudComputing::Application.routes.draw do
  resources :blocks


  resources :posts


  resources :messages


  mount Ckeditor::Engine => '/ckeditor'
  
  get "carousel/index"

  get "category/index"
  get "articles/index"
  
  namespace :attachment do
    get '', :action => :index
    post '', :action => :upload
  end
  
  namespace :login do
    get '', :action => :index
    post '', :action => :index
  end

  resources :personal
  resources :visitor_index, only: [:index, :show]
  resources :category
  resources :articles do
    get "tag", :action => :tag
    member do
      get 'raw'
    end
  end
  resources :comments, :only => [:create]
  resources :admin, :only => [:index]

  namespace :admin do
    get '', :action => :index
    resources :lesson_table, only: [:edit, :destroy, :index, :update] do
      member do
        get '', :action => :index
        get 'new_lesson'
      end
    end
    get 'login'
    post 'login', :action => :auth
    resources :category, only: [:edit, :destroy, :index, :update] do
      member do
        get '', :action => :index
        get 'new_sub'
        get 'upward'
        get 'downward'
        get 'switch_show'
      end
    end
    resources :article, only: [:edit, :destroy, :index, :update] do
      member do
        get '', :action => :index
        get 'add'
      end
    end
    resources :user, only: [:index, :edit, :update, :show] do
      member do
        #get '', :action => :index
        #get 'authorize/:priviledge', :action => :authorize
        #get 'unauthorize/:priviledge', :action => :unauthorize
        get 'switch/:priviledge', :action => :switch
      end
    end
    resources :priviledge, only: [:show, :index] do
      member do
        #get '', :action => :index
      end
    end
    resources :carousel
    match 'plugins/carousel' => 'carousel#index'
    match 'carousel/add' => 'carousel#add'
    resources :plugins, only: [:index, :edit] do
      member do
        get '', :action => :index
        post 'enable', :action => :toggle_enable
      end
    end
  end

  root :to => "visitor_index#show"
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
