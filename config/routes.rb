Rails.application.routes.draw do
  devise_for :users
  root 'tasks#index'
  resources :tasks
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
