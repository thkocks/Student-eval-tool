Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :batches do
    resources :students
  end
  resources :days
  resources :remarks
end
