Rails.application.routes.draw do

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  namespace :admin do
    resources :users
  end
  root to: 'questions#index'
  resources :questions
  get '/question/solved', to: 'questions#solved'
  get '/question/unsolved', to: 'questions#unsolved'
  resources :users
  get '/answer', to: 'answers#index'
  get '/answer/new.:id', to: 'answers#new', as: 'new_answer'
  post '/answer.:id', to: 'answers#create', as: 'answers'
  get '/answer.:id', to: 'answers#edit', as: 'edit_answer'
  delete '/answer.:id', to: 'answers#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
