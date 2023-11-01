Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items do
    resources :records, only: [:index, :new, :create]
  end
end
