require 'google/api_client'
require 'google/api_client/auth/installed_app'
require 'launchy'

class GoogleDriveService

  CLIENT_ID    = ENV['GOOGLE_TODO_OAUTH_CLIENT_ID']
  SECRET       = ENV["GOOGLE_API_TODO_SECRET_KEY"]
  REDIRECT_URI = 'http://localhost:3000/auth/google_oauth2/callback'
  SCOPE       = [
    'https://www.googleapis.com/auth/drive',
    'https://www.googleapis.com/auth/userinfo.email',
    'https://www.googleapis.com/auth/userinfo.profile'
  ]

  # returns the first worksheet of the 'todos' spreadsheet
  # in google docs
  def self.fetch_todos(token)
    session = GoogleDrive.login_with_oauth token
    todos   = session.file_by_title 'todos'

    if !todos 
      todos = session.create_spreadsheet 'todos'
      ws    = todos.worksheets[0]
      
      # create headers
      ws[1,1] = 'Title'
      ws[1,2] = 'Description'
      ws[1,3] = 'DateCreated'
      ws[1,4] = 'DateDue'
      ws[1,5] = 'IsComplete'
      ws.save
    end

    todos.worksheets[0]
  end 
  
  def self.fetch_file_list(token)
    client = Google::APIClient.new(
      :application_name    => 'Todo List',
      :application_version => '1.0.0'
    )

    drive = client.discovered_api('drive', 'v2')

    # request authorization
    client.authorization.client_id     = CLIENT_ID
    client.authorization.client_secret = SECRET
    client.authorization.scope         = SCOPE
    client.authorization.redirect_uri  = REDIRECT_URI 
    client.authorization.access_token  = token

    page_token = ''
    result = []
    begin
      api_result = client.execute :api_method => drive.files.list
      if api_result.status == 200
        files = api_result.data
        result.concat files.items
        page_token = files.next_page_token
      end
    end while page_token.to_s != ''

    result
  end









##
  # Error raised when an error occurred while retrieving credentials.
  # class GetCredentialsError < StandardError
  #   ##
  #   # Initialize a NoRefreshTokenError instance.
  #   #
  #   # @param [String] authorize_url
  #   #   Authorization URL to redirect the user to in order to in order to request
  #   #   offline access.
  #   def initialize(authorization_url)
  #     @authorization_url = authorization_url
  #   end

  #   def authorization_url=(authorization_url)
  #     @authorization_url = authorization_url
  #   end

  #   def authorization_url
  #     return @authorization_url
  #   end
  # end

  # ##
  # # Error raised when a code exchange has failed.
  # class CodeExchangeError < GetCredentialsError
  # end

  # ##
  # # Error raised when no refresh token has been found.
  # class NoRefreshTokenError < GetCredentialsError
  # end

  # ##
  # # Error raised when no user ID could be retrieved.
  # class NoUserIdError < StandardError
  # end





end