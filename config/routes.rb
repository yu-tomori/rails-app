Rails.application.routes.draw do
  
  get 'tags/create'

  get 'tagmaps/create'

  get 'tagmaps/destroy'

  get 'likes/create'

  get 'likes/destroy'

  get 'sessions/create'

  get 'comments/new'

  get 'static_pages/home' 
  get 'privacy', to: 'static_pages#privacy'
  get 'terms', to: 'static_pages#terms'
  get 'contact', to: 'static_pages#contact'
  get 'static_pages/search'
  get 'static_pages/menu'
  root 'static_pages#home'
  resources :users do
   member do
    get :following, :followers
   end
  end
  resources :relationships, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :tagmaps, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]

  get 'articles', to: 'articles#new'
  resources :articles do
    member do
     get :tag
    end
  end

  resources :tagmaps, only: [:create, :destroy]

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
}
end
