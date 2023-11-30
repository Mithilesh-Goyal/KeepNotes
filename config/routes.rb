Rails.application.routes.draw do

  devise_for :users
  # root "notes#home"
  root "notes#index"
  get 'notes/archived', :to => 'notes#archived'
  get 'notes/bin', :to => 'notes#bin'
  get 'notes/show_label', :to => 'notes#show_label'
  get 'notes/edit_color', :to => 'notes#edit_color'
  get "note/notesshow" => 'note#notesshow', :as => :notesshow
  get 'notes/search', :to => 'notes#search'
  get '/update/:id' , to: "root#update"
  get 'notes/label_note', :to => 'notes#label_note'
  get 'notes/home', :to => 'notes#home'
  # get 'notes/user', :to => 'notes#user'

  resources :notes do
    member do
      put :archive
      put :active
      put :notarchive
      put :deleted_at
      patch :soft_delete
      put :restore
      put :pinned
      put :unpinned
      patch :add_label
      get :update_color
      post :create_copy
      post :copy
      post :copy_note
      delete :delete_image
      delete :delete_background_image
      patch :set_reminder
      post :send_mail
    end
  end
  resources :labels

  Rails.application.routes.draw do

    root to: 'users#new'

    get 'users/new' => 'users#new', as: :new_user
    post 'users' => 'users#create'

    # ----- add these lines here: -----

    # log in page with form:
    get '/login'     => 'sessions#new'

    # create (post) action for when log in form is submitted:
    post '/login'    => 'sessions#create'

    # delete action to log out:
    delete '/logout' => 'sessions#destroy'

      # ----- end of added lines -----

  end

end
