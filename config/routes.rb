Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'homes/how' => 'homes#how',as: 'how'
  get 'homes/index' => 'homes#index', as: 'home'

  resources :tasks, only: [:new, :create, :index, :edit, :update, :destroy]

  get 'users/my_page' => 'users#show'
  resources :users, only: [:edit, :update]

  resources :task_histories, only: [:new, :create, :index, :edit, :update, :destroy]

  resources :groups, only: [:new, :create]



  get '/charts' => 'charts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
