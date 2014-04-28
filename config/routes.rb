Rails.application.routes.draw do

  resource :profile, only: [:show, :edit, :update]
  resources :certifications, only: [:index, :show, :create] do
    resources :questions, only: :index
  end

  root 'page#home'
  devise_for :users
end
