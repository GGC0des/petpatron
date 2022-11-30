Rails.application.routes.draw do
  get 'avatars/edit', as: :avatar_edit
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'dashboard', to: 'pages#dashboard', as: :dashboard
  resources :shelters

  resources :animals do
    resources :caretakings, only: [:create, :show]
  end

  resources :emergencies, only: [:index, :show, :new, :create, :destroy] do
    resources :donations, only: [:create, :show]
  end
end
