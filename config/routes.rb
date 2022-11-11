Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'home', to: "pages#home"
  get 'my_page',to:"pages#my_page"
  get "pets", to: "pets#index"

  resources :pets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
