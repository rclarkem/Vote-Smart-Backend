Rails.application.routes.draw do
  scope :representives do 
    resources :federal_representives, path: :federal, to: :federal
    resources :local_representives, path: :local, to: :local
  end
end
