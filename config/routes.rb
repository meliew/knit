Rails.application.routes.draw do
  root 'sessions#new' 
  resources :users
  post '/auth/:provider/callback', to: 'sessions#create'
  resource :sessions
end
