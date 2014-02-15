# == Schema Information
#
# Table name: sessions
#
#  id :integer          not null, primary key
#

class Session < ActiveRecord::Base
  attr_accessible :gmail_address, :password, :password_confirmation
  has_secure_password
end
