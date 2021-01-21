Rails.application.routes.draw do
  devise_for :users
  get 'charts/index'
  get 'task_histories/new'
  get 'task_histories/create'
  get 'task_histories/index'
  get 'task_histories/edit'
  get 'task_histories/update'
  get 'task_histories/destroy'
  get 'tasks/new'
  get 'tasks/create'
  get 'tasks/index'
  get 'tasks/edit'
  get 'tasks/update'
  get 'tasks/destroy'
  get 'groups/new'
  get 'groups/create'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'homes/top'
  get 'homes/how'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
