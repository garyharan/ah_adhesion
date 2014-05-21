Rails.application.routes.draw do
  root 'page#home'
  get 'comment_ca_fonctionne',  to: 'page#how_this_works'
  get 'merci',                  to: 'page#merci'
  get 'paypal_success',         to: 'page#paypal_success'

  get 'questions/index'

  resource :profil, only: [:edit, :update], controller: 'profiles'

  resources :attachments, only: [:new, :create, :destroy]

  resources :certifications, only: [:index, :show, :edit, :update, :create] do
    post :submit
    get :payment
    resources :questions, only: :index
  end

  resources :answers

  devise_for :users
end
