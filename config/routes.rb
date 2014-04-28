Rails.application.routes.draw do

  resource :profile, only: [:show, :edit, :update]
  resources :certifications, only: [:index, :show, :create]

  root 'page#home'
  devise_for :users
end
