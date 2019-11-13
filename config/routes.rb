Rails.application.routes.draw do
  resources :users, only: [:create, :show, :index] do
    namespace :representatives do 
      resources(:federal_representatives, path: :federal) do
        resources :bills, only: [:index]
      end 
      # resources :local_representatives, path: :local
    end
  end
end