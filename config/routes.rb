Rails.application.routes.draw do
  resources :users, only: [:create, :show]
  
  scope :representives do 
    resources(:federal_representives, path: :federal) do
      resources :bills, only: [:index]
    end 
    resources :local_representives, path: :local
  end

end