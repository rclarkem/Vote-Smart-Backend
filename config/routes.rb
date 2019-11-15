Rails.application.routes.draw do
  resources :users, only: [:create, :show, :index, :update, :destroy] 
  resources :representatives, only: [:index, :show]
  get '/bills/voted/:id', to: 'bills#user_voted_bills'
  delete '/bills/voted/:id', to: 'bills#destroy'
  resources :representatives_user, only: [:create, :show], path: '/bills'
  # post '/bills', to: 'representatives_user#create'
  # get '/bills/:id', to: 'bills#show'
end