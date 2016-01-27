Rails.application.routes.draw do
  root 'home#home'

  get '/sign-up' => 'users#new'
  get  '/sign-in' => 'sessions#new'
  post '/sign-in' => 'sessions#create'

  resources :users
end
