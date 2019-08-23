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
  post '/accept', to: 'offers#accept'
  post '/decline', to: 'offers#decline'
  post '/confirmed_offer', to: 'offers#confirmed_offer'
  post '/offers/new', to: 'offers#new'
  get '/offers_to_submit', to: 'offers#to_submit'
  get '/questions_to_answer', to: 'question_answers#to_answer'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'login#new'
end
