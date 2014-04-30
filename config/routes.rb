Rails.application.routes.draw do

  get 'comment_ca_fonctionne', to: 'page#how_this_works'
  get 'questions/index'

  resource :profil, only: [:edit, :update], controller: 'profiles'
  resources :attachments, only: [:new, :create]
  resources :certifications, only: [:index, :show, :edit, :create] do
    post :submit
    get :payment
    resources :questions, only: :index
  end

  resources :answers

  root 'page#home'
  devise_for :users
end
