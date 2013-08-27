Smartprovider::Application.routes.draw do

  resources :users

  resources :clients do
    resources :notes
    resources :vitals
    member do
      post 'add_user_to'
    end
  end

  resources :notes do
    resources :follow_ups, only: [:new, :create]
  end

  resources :follow_ups do
    member do
      get :complete
    end
  end

  # get /users?method=delete&id=4
  # get /clients/4/add_user/130
  # params[:client_id]
  # post 'clients/:client_id/add_user/:user_to_assign', to: "clients#show"
  # post 'add_user', to: "clients#add_user"



  get '/login', to: 'login#new'
  post '/login', to: 'login#create'
  get '/logout', to: 'login#logout'

  root 'welcome#index'
end
