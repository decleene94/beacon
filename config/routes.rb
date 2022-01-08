Rails.application.routes.draw do
  # resources :users
  resources :follows
  post 'twilio/sms'
  root to: 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :radars do
    resources :messages, only: [ :show, :create]
  end

  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"

end
