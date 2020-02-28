Rails.application.routes.draw do
  root 'sessions#new' 
  post '/auth/:provider/callback', to: 'sessions#create'
  resources :users
end
