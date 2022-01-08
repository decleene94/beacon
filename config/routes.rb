Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :radars do
    resources :messages, only: [ :show, :create]
  end

  # resources :radars do
  #   get 'join', on: :member
      # resources :participants, only: [:create]
  # end

  # resources :radars do
  #   get 'join', on: :member
  #   post 'join', on: :member
  # end


get '/radars/:id/join', to: 'participants#join', as: 'join'
# post '/radars/:id/participants/leave', to: 'participants#leave'

end
