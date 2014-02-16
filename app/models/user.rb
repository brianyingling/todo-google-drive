class User < ActiveRecord::Base

  # finds or creates a user from omniauth response
  def self.from_omniauth(auth)
    binding.pry
    where(auth.slice('provider', 'uid')).first || create_from_omniauth(auth)
  end

  # creates from omniauth 
  def self.create_from_omniauth(auth)
    create! do |u|
      u.provider   = auth['provider']
      u.uid        = auth['uid']
      u.first_name = auth['info']['first_name']
      u.last_name  = auth['info']['last_name']
      u.email      = auth['info']['email']
      u.image      = auth['info']['image']
    end
  end
end