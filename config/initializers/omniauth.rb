OmniAuth.config.full_host = "http://localhost:3000"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_TODO_OAUTH_CLIENT_ID"], ENV["GOOGLE_API_TODO_SECRET_KEY"], 
  {
    :scope => 'userinfo.profile, userinfo.email, drive, https://docs.google.com/feeds/, https://docs.googleusercontent.com/, https://spreadsheets.google.com/feeds/',
    :provider_ignores_state => true
  }
end



