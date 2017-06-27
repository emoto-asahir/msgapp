Rails.application.routes.draw do
  resources :users
  resources :tests
  root to: 'static_pages#home'
  get 'login' , to: 'aaa#new'
  post 'login' , to: 'aaa#create'
  get 'logout' , to: 'aaa#destroy'
  get 'test' , to: 'aaa#test'
  get '/custom_token/:id',to: 'firebase_tokens#show_token'
  get '/roo/aaa',to: 'chat_rooms#show_a_room'
  get '/room/:receiver_id/:sender_id',to: 'chat_rooms#show_the_room'
  post 'friendships' , to: 'friendships#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
