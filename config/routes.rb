Rails.application.routes.draw do
  root 'sessions#home'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  resources :tasks 
  
  resources :users do
    resources :tasks
  end

  resources :projects do
       resources :tasks
  end

  get '/auth/:google_oath2/callback' => 'sessions#google'

end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
