Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"

  resources :realties do
    resources :claims, only: [:index, :new, :create, :edit, :update, :show]
    resources :documents, only: [:index, :create]
    resources :messages, only: [:index, :create]
    resources :tenants, only: [:create, :new]

    resources :candidatures, only: [:index,:create, :new]

  end

  resources :claims do
    member do
      patch :accept
      patch :done
      patch :refuse
    end
  end
  resources :documents, only: [:show, :destroy] do
    post :download_files, on: :member
  end
end
