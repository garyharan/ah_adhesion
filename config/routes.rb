Rails.application.routes.draw do

  # http://adhesion.reservert.com/paypal_success

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'comment_ca_fonctionne', to: 'page#how_this_works'
  get 'questions/index'

  resource :profil, only: [:edit, :update], controller: 'profiles'

  resources :attachments, only: [:new, :create, :destroy]

  resources :certifications, only: [:index, :show, :edit, :create] do
    post :submit
    get :payment
    resources :questions, only: :index
  end

  resources :answers

  root 'page#home'
  devise_for :users
end
