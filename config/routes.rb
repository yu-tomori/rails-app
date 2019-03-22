Rails.application.routes.draw do
  
  get 'likes/create'

  get 'likes/destroy'

  get 'sessions/create'
  get 'static_pages/home' 
  root 'static_pages#home'
  resources :users do
   member do
    get :following, :followers
   end
  end
  resources :relationships, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]

  get 'articles', to: 'articles#new'
  resources :articles

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
}
end
