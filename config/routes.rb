Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :batches
  resources :students
  resources :days
  resources :remarks
end
