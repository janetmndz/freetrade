Rails.application.routes.draw do
  resources :reviews
  resources :offers
  resources :question_answers
  resources :items
  resources :users

  get '/welcome', to: 'login#new'
  post '/login', to: 'login#create' 
  get '/signup', to: 'login#signup'
  get '/my_items', to: 'items#my_items'
  delete '/logout', to: 'items#logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'login#new'
end
