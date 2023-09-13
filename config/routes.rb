Rails.application.routes.draw do

  devise_for :users
  root to: 'notes#index'

  resources :notes do
    member do
      patch :archive
      patch :unarchive
      post 'pin', to: 'notes#pin'
      post 'unpin', to: 'notes#unpin'
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
