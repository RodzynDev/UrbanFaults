Rails.application.routes.draw do
  get '/login' => "users#new" , as: :login
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: :logout
  get '/profile' => 'users#show', as: :show_profile
  get '/edit_profile' => 'users#edit', as: :edit_profile
  resources :users, only: [:create, :update]
  get '/forgot_pwd' => 'users#forgot_pwd', as: :forgot_pwd
  
  get '/research' => "reports#index"
  resources :reports, only: [:new, :create, :show, :edit]
  
  get '/admin' => 'admin#index', as: :admin_panel
  
  get '/index' => 'home_pages#index', as: :home
  root 'home_pages#index'
end