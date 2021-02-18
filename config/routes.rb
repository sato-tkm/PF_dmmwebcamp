Rails.application.routes.draw do

  resources :movies do
    resources :movie_comments, only: [:create, :destroy]
  end
  devise_for :users
  root to: 'homes#top'
end
