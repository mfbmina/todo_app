Rails.application.routes.draw do
  resources :todo_lists
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show]

  root 'users#index'
end
