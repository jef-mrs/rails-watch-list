Rails.application.routes.draw do
  root to: 'lists#index'
  resources :lists, only: %i[show new create] do
    resources :bookmarks, only: %i[create]
    resources :reviews, only: %i[create]
  end
  resources :bookmarks, only: %i[destroy]
end
