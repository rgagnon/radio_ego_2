RadioEgo2::Application.routes.draw do
  resources :audios

  get "home/index"

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
  match 'signin', to: 'sessions#new', as: 'signin'
  match 'ego/listen/:id', to: 'audios#listen', as: 'listen'

  root to: 'home#index'
end
