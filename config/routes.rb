Rails.application.routes.draw do

  get 'how_this_works', to: 'page#how_this_works'
  get 'questions/index'

  resource :profile, only: [:show, :edit, :update]
  resources :certifications, only: [:index, :show, :create] do
    resources :questions, only: :index
  end

  root 'page#home'
  devise_for :users
end
