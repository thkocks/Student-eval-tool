Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :batchs
  resources :students
  resources :days
  resources :remarks
end
