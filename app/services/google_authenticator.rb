require 'google_drive'

class GoogleAuthenticator

  # returns a GoogleDrive session obj if successful, otherwise
  # return an error
  def authenticate(gmail_address, password)
    begin
      GoogleDrive.login gmail_address, password
    rescue Exception => e
      e 
    end
  end
end