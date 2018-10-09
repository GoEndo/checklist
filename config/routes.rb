Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'

  resources :sprints do
    resources :task_status
  end

  resources :teams do
    resources :task_status
  end

  resources :tasks
  resources :users

  get 'teams/index'
  root 'teams#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :account_activations, only: [:edit]
end
