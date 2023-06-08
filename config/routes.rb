Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :realties do
    resources :claims, only: [:index, :new, :create, :edit, :update]
    resources :documents, only: [:index, :create]
    resources :messages, only: [:index, :create]
    resources :tenants, only: [:create, :new]
  end


  resources :claims, only: [:show, :edit, :update, :destroy]
  resources :documents, only: [:show, :destroy] do
    post :download_files, on: :member
  end

  resources :claims, only: [:show, :destroy]
end
