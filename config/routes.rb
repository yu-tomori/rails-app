Rails.application.routes.draw do
  
  get 'sessions/create'
  get 'static_pages/home' 
  root 'static_pages#home'
  resources :users

  get 'articles', to: 'articles#new'
  resources :articles

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
}
end
