Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: "registrations", omniauth_callbacks: 'users/omniauth_callbacks'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  resources :posts do
    resources :comments
  end
  put '/post/:id/like', to: 'posts#like', as: 'like'
  get '/post/:id/payment', to: 'posts#payment', as: 'payment'
end
