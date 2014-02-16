TodoGoogleDrive::Application.routes.draw do

  root :to => 'home#index'

  resources :sessions, :only => [:new, :create, :oauth]

  # get '/oauth/google/callback'    => 'sessions#oauth_google_callback', :as => 'oauth_google_callback'
  get "/auth/:provider/callback" => 'sessions#create',       :as => 'oauth_google_callback'
  get '/oauth/google'            => 'sessions#oauth_google', :as => 'oauth_google'
end
