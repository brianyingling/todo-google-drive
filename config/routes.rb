TodoGoogleDrive::Application.routes.draw do

  root :to => 'home#index'

  resources :sessions, :only => [:new, :create, :oauth]

  get '/oauth'      => 'sessions#oauth',      :as => 'oauth_callback'
get '/oauthlogin' => 'sessions#oauth_login', :as => 'oauth_login'  
end
