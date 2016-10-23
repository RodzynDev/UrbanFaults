Rails.application.routes.draw do
  get '/login' => "users#new" , as: :login
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: :logout
  
  get '/profile' => 'users#show', as: :show_profile
  get '/edit_profile' => 'users#edit', as: :edit_profile
  resources :users do
    get 'autocomplete_city_cname', on: :collection
  end
  resources :users, only: [:create, :update]
  get '/forgot_pwd' => 'users#forgot_pwd', as: :forgot_pwd
  
  get '/research' => "reports#index"
  resources :reports do
    get 'autocomplete_city_cname', on: :collection
  end
  resources :reports, only: [:new, :create, :show, :edit]
  
  scope :admin do
    get '/users' => 'admin#users', as: :admin_users_list
    get '/manage_reports' => 'admin#reports', as: :admin_manage_reports
  end
  
  get '/index' => 'home_pages#index', as: :home
  root 'home_pages#index'
end