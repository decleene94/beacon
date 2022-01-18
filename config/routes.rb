Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :users
  resources :follows
  post 'twilio/sms'
  root to: 'pages#home'
  devise_for :users

  resources :radars do
    resources :messages, only: [ :show, :create]
    post 'join', on: :member
    post 'leave', on: :member
  end

  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"
  post '/users/:id/save', to: "users#save"
end
