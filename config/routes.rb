Rails.application.routes.draw do
  resources :certifications

  root 'page#home'
  devise_for :users
end
