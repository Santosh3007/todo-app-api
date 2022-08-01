# frozen_string_literal: true

Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'
  post 'authorize', to: 'application#check_token'
  resources :users

  namespace :api do
    namespace :v1 do
      resources :subtasks
      get 'tasks/completed' => 'tasks#completed'
      get 'tasks/incomplete' => 'tasks#incomplete'
      get 'tasks/overdue' => 'tasks#overdue'
      get 'subtasks/completed' => 'subtasks#completed'
      get 'subtasks/incomplete' => 'subtasks#incomplete'
      get 'subtasks/overdue' => 'subtasks#overdue'
      resources :tasks
    end
  end

  patch 'update_password', to: 'users#update_password'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
