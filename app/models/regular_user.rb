# Represents a standard user that logs in to our
# system with a username/password
class RegularUser < User 
  has_secure_password
  validates :first_name, :last_name, :email, :presence => true
  validates :email, :email => true
  validates :email, :uniqueness => {:case_sensitive => false}
end