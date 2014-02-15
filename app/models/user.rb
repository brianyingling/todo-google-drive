# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  first_name      :string(255)
#  last_name       :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  has_many :accounts, :dependent => :destroy
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation

  def has_facebook?
    accounts.where(:provider => 'facebook').any?
  end
  def has_twitter?
    accounts.where(:provider => 'twitter').any?
  end
  def has_foursquare?
    accounts.where(:provider => 'foursquare').any?
  end
  def has_google?
    accounts.where(:provider => 'google').any?
  end
end
