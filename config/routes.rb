Rails.application.routes.draw do
  root to: 'notes#index'
  resources :notes do
    member do
      patch :archive
      patch :unarchive
    end
    collection do
      get :archive_index
    end
  end
  resources :trash_notes  do
    member do
      patch :restore
    end
  end
end
