class SessionsController < ApplicationController

  # before_filter :auth_oauth

  def new
  end

  def create
    user = User.from_omniauth request.env['omniauth.auth']
    session[:user_id] = user.id
    redirect_to root_path
  end

  def oauth_google_callback
    binding.pry
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

  private

  def create_google_oauth_client
    @client   = ''
    client_id = ENV['GOOGLE_TODO_OAUTH_CLIENT_ID']
    secret    = ENV['GOOGLE_API_TODO_SECRET_KEY']
    
    params    = {
      :site          => "https://accounts.google.com",
      :token_url     => "/o/oauth2/token",
      :authorize_url => "/o/oauth2/auth"
    } 
    OAuth2::Client.new client_id, secret, params
  end

  def google_oauth_auth_params
    {
      :redirect_uri => 'http://localhost:3000/oauth/google/callback',
      :scope        => "https://docs.google.com/feeds/ " +
                       "https://docs.googleusercontent.com/ " +
                       "https://spreadsheets.google.com/feeds/"
    }
  end

  def session_params
    params.require(:session).permit(:gmail_address, :password, :password_digest)
  end

end