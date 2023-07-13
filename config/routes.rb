Rails.application.routes.draw do
  root to: 'notes#index'
  resources :notes
  resources :trash_notes  do
    member do
      patch :restore
    end
  end
end
