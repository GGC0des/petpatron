Rails.application.routes.draw do
  get 'avatars/edit', as: :avatar_edit
  patch 'avatars/update', as: :avatar_update
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'about', to: 'pages#about'

  get 'dashboard', to: 'pages#dashboard', as: :dashboard
  resources :shelters

  resources :animals do
    resources :caretakings, only: [:create, :show]
    resources :emergencies, only: [:new, :create]
  end
  resources :caretakings, only: [:destroy]
  put "/caretakings/:id/confirm", to: "caretakings#confirm!", as: 'confirm_caretaking'

  resources :emergencies, only: [:index, :show, :edit, :update, :destroy] do
    resources :donations, only: [:new, :create, :show]
  end
end
