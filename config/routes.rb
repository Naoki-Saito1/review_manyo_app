Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'tasks#index'
  resources :tasks
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
