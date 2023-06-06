Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :realties do
    resources :claims, except: [:show]
    resources :documents, only: [:index, :new, :create]
    resources :messages, only: [:index, :create]
    resources :tenants, only:[:create, :new]
  end
end
