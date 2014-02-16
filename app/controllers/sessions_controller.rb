class SessionsController < ApplicationController

  # before_filter :auth_oauth

  def create
    user = User.from_omniauth request.env['omniauth.auth']
    session[:user_id] = user.id
    redirect_to todos_path
  end

  def destroy
    session[:user_id] = nil if session[:user_id].present?
    redirect_to root_path
  end

  def oauth_google_callback
    client     = create_google_oauth_client
    auth_token = client.auth_code.get_token params[:code], :redirect_uri => "http://localhost:3000/oauth/google/callback"
    @session   = GoogleDrive.login_with_oauth auth_token.token
    redirect_to root_path
  end

  def oauth_google
    client   = create_google_oauth_client
    auth_url = client.auth_code.authorize_url google_oauth_auth_params
    redirect_to auth_url
  end
end