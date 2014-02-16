TodoGoogleDrive::Application.routes.draw do

  root :to => 'home#index'

  resources :todos, :only => [:index]
  
  get "/auth/:provider/callback" => 'sessions#create',       :as => 'oauth_google_callback'
  get '/oauth/google'            => 'sessions#oauth_google', :as => 'oauth_google'
  get '/logout'                  => 'sessions#destroy', :as => 'logout'

end
