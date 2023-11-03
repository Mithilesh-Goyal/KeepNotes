Rails.application.routes.draw do
  root "notes#index"
  get 'notes/archived', :to => 'notes#archived'
  get 'notes/bin', :to => 'notes#bin'
  get 'notes/show_label', :to => 'notes#show_label'
  get 'notes/edit_color', :to => 'notes#edit_color'
  get "note/notesshow" => 'note#notesshow', :as => :notesshow
  get 'notes/search', :to => 'notes#search'
  get '/update/:id' , to: "root#update"

  resources :notes do
    member do
      put :archive
      put :active
      put :notarchive
      put :deleted_at
      put :soft_delete
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

    end
  end
  resources :labels
end
