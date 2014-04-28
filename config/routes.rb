Rails.application.routes.draw do
  resources :certifications, only: [:index, :show, :create]

  root 'page#home'
  devise_for :users
end
