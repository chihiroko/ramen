Rails.application.routes.draw do
  get 'posts/syouyu' => 'posts#syouyu'
  get 'posts/sio' => 'posts#sio'
  get 'posts/miso' => 'posts#miso'
  get 'posts/tonkotu' => 'posts#tonkotu'
  get 'posts/iekei' => 'posts#iekei'
  get 'posts/zirou' => 'posts#zirou'

  
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'posts/toppage' => 'posts#toppage'
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  root "posts#index"
  end
  
  

