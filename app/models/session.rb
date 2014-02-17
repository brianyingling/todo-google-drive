# == Schema Information
#
# Table name: sessions
#
#  id              :integer          not null, primary key
#  gmail_address   :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class Session < ActiveRecord::Base
  attr_accessible :gmail_address, :password, :password_confirmation
  has_secure_password
end
