Rails.application.routes.draw do

  resources :students
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :data
  resources :categories do
    collection do
      get :sorted
      get :search_result
    end
  end
  resources :books do
    collection do
      get :sorted
      get :search_result
    end
  end
  root "books#index"
  #get '/auth/:provider/callback', to: 'sessions#create'
  #get 'auth/:provider/callback', to: 'sessions#create'
  #get 'auth/failure', to: redirect('/')
  	
  	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
