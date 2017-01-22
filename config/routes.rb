Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show]
  resources :todo_lists
  resources :tasks, only: [] do
    patch :close, on: :member
  end

  root 'users#index'
end
