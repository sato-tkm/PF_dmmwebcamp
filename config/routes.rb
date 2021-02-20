Rails.application.routes.draw do

  resources :movies do
    resources :movie_comments, only: [:create, :destroy] do
      resources :likes, only: [:create, :destroy]
    end
  end
  devise_for :users
  root to: 'homes#top'
  get 'search', to: 'movies#search'

end
