Rails.application.routes.draw do
  
  root 'home#index'

  get '/offering', to: 'offering#index'
  get '/offering/:id', to: 'offering#index'
  post '/offering', to: 'offering#post'

  devise_for :users, controllers: { registrations: "users/registrations" }
  # See how all your routes lay out with "rake routes".

  
  devise_scope :user do
  #  root to: 'home#index'
    
    authenticated :user do
       get '/dashboard' => 'dashboard#get'
       post '/dashboard' => 'dashboard#post'
    end
  
    unauthenticated :user do
      get '/dashboard' => 'devise/sessions#new'
      post '/dashboard' => 'dashboard#post' 
    end
  end 
end 

