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
    resources :claims, except: [:show]
    resources :documents, only: [:index, :new, :create]
    resources :messages, only: [:index, :create]
    resources :tenants, only:[:create, :new]
  end
end
