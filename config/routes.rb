Rails.application.routes.draw do

  resources :movies
    resources :movie_comments, only: [:create, :destroy]
  devise_for :users
  root to: 'homes#top'
end
