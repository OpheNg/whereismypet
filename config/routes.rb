Rails.application.routes.draw do
  get 'messages/conversations'
  get 'messages/index'
  get 'messages/create'
  devise_for :users
  resources :users
  root to: 'pages#home'

  get 'home', to: "pages#home"
  get 'my_page',to:"pages#my_page"
  get "pets", to: "pets#index"
  get 'profile', to: "users#show"
  get 'my_posts', to: "pages#my_posts"

  # chat
  get 'conversations', to: 'messages#conversations'
  resources :users do
    resources :messages, only: [:index, :create]
  end


  resources :pets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
