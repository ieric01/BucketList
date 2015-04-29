Rails.application.routes.draw do

  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

    resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end



  resources :search_suggestions
  resources :comments
  post "/new_message", :to => 'mailbox#send_message'

  get "/mailbox/inbox", :to => 'mailbox#inbox'
  get "/new_message", :to => 'mailbox#new_message'
  #the event link from the todos page should hit the events form page where u create the event
  get "/todos/:todo_id/events/new", :to => 'events#new'


  get "/todos/:todo_id/events", :to => 'events#list_events'
  post "/events" => 'events#create'
  # post '/' => 'todos#search'
  resources :events

  get "/users", :to => 'users#index'
  get "/auth/facebook/callback", :to => 'sessions#create'
  get "/auth/guest_login", :to => 'sessions#guest_login'
  get "/signout", :to => 'sessions#destroy'
  get "/mylist", :to => 'todos#my_list'
  get "/users_with_this_todo/:todo", :to => 'todos#users_with_this_todo'
  get "/see_user_list/:name", :to => 'users#see_user_list'
  get "/rsvp/:event_id", :to => 'events#rsvp'
  get "/attendees/:event_id", :to => 'events#attendees_list'
  get "/leave_event/:event_id", :to => 'events#leave_event'
  delete "todos/:todo_id/destroy/:event_id", :to => 'events#destroy'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#home'
  
  resources :todos

  # post '/' => 'todos#search'
  
  #Testing 

  get '/todos/:id' => 'todos#show'
  
  post '/search_suggestions' => 'search_suggestions#index'

  get '/search' => 'todos#search'

  get "/add_to_list/:todo", :to => 'todos#add_todo_to_user'
  get "/delete_from_list/:todo", :to => 'todos#delete_todo_from_user'
  get "/complete_todo/:id", :to => 'todos#complete_todo'
  get "/completed_list", :to => 'todos#complete_show'


 
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
