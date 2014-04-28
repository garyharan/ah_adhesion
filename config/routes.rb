Rails.application.routes.draw do
  root 'page#home'
  devise_for :users
end
