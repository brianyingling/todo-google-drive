class SessionsController < ApplicationController

  before_filter :auth_oauth

  def new
    @session = Session.new
  end

  def create
    @session = Session.create params[:session]
    binding.pry
    redirect_to root_path
  end

  def oauth
    auth_token = @client.auth_code.get_token params[:code], :redirect_uri => "http://localhost:3000/oauth"
    @session   = GoogleDrive.login_with_oauth auth_token.token
    binding.pry
    redirect_to root_path
  end

  def oauth_login
    redirect_to @auth_url
  end

  private

  def auth_oauth
    @client   = ''
    client_id = ENV['GOOGLE_TODO_OAUTH_CLIENT_ID']
    secret    = ENV['GOOGLE_API_TODO_SECRET_KEY']
    
    params    = {
      :site          => "https://accounts.google.com",
      :token_url     => "/o/oauth2/token",
      :authorize_url => "/o/oauth2/auth"
    } 

    auth_params = {
      :redirect_uri => 'http://localhost:3000/oauth',
      :scope        => "https://docs.google.com/feeds/ " +
                        "https://docs.googleusercontent.com/ " +
                        "https://spreadsheets.google.com/feeds/"
    }

    @client  = OAuth2::Client.new client_id, secret, params
    @auth_url = @client.auth_code.authorize_url auth_params
  end

  def session_params
    params.require(:session).permit(:gmail_address, :password, :password_digest)
  end

end