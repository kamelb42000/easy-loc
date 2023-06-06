Rails.application.routes.draw do
  get 'realties/index'
  get 'realties/new'
  get 'realties/show'
  get 'realties/edit'
  get 'realties/update'
  get 'realties/create'
  get 'realties/destroy'
  devise_for :users
  root to: "pages#home"
  resources :realties do

    resources :claims, only: [:index,:new,:create]
    resources :documents, only: [:index, :create]

    resources :messages, only: [:index, :create]
    resources :tenants, only:[:create, :new]
  end

  resources :claims, only: [:show, :edit, :update, :destroy]


end
