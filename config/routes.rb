Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'

  get 'users/new'

  root 'pages#index'
  get 'pages/help'

  resources :users
  resources :topics

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'

  resources :topics do
    resources :comments, only: [:create]
  end
end
