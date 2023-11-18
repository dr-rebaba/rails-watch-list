Rails.application.routes.draw do
  resources :movies, only: [:index, :show]
  resources :lists, only: [:index, :show]
  resources :bookmarks, only: [:index, :show]
end
