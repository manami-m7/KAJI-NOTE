Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'homes#top'
  get 'homes/how' => 'homes#how',as: 'how'
  get 'homes/index' => 'homes#index', as: 'home'

  resources :tasks, only: [:new, :create, :index, :edit, :update, :destroy]

  resources :users, only: [:edit, :update]

  post 'task_histories/start' => 'task_histories#start', as: 'start'
  patch 'task_histories/finish' => 'task_histories#finish', as: 'finish'
  resources :task_histories, only: [:new, :index, :edit, :update, :destroy]

  resources :groups, only: [:new, :create]

  get '/charts' => 'charts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
