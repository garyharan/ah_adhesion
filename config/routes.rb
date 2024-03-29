Rails.application.routes.draw do
  root 'page#home'
  get 'comment_ca_fonctionne',  to: 'page#how_this_works'
  get 'merci',                  to: 'page#merci'
  get 'paypal_success',         to: 'page#paypal_success'

  get 'questions/index'

  resource :profil, only: [:edit, :update], controller: 'profiles'

  resources :attachments, only: [:new, :create, :destroy]

  resources :dossiers, only: [:index, :show, :edit, :update, :create] do
    post :submit
    get :payment
    get :widget
    get :widget_voting_system
    resources :questions, only: :index
  end

  resources :answers do
    member do
      put :vote
    end
    resources :reports do
      member do
        get :thank_you
      end
    end
  end

  devise_for :users

  namespace :admin do
    root to: "dossiers#index"
    resources :dossiers do
      resources :reports
    end
  end

  #redirectnig the certifications questions url to dossier questions url
  get '/certifications/:dossier_id/questions', to: redirect('/dossiers/%{dossier_id}/questions')
end

