Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_TODO_OAUTH_CLIENT_ID"], ENV["GOOGLE_API_TODO_SECRET_KEY"]
end