Rails.application.routes.draw do

  get 'how_this_works', to: 'page#how_this_works'
  get 'questions/index'

  resource :profile, only: [:edit, :update]
  resources :attachments, only: :update
  resources :certifications, only: [:index, :show, :create] do
    resources :questions, only: :index
  end

  resources :answers

  root 'page#home'
  devise_for :users
end
