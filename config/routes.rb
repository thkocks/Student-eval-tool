Rails.application.routes.draw do
  root to: 'batches#index'

  devise_for :users

  resources :batches do
    resources :students do
      resources :days
    end
  end

  resources :remarks
end
