Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
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
  resources :statuses

  get 'teams/index'
  root 'teams#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
end
