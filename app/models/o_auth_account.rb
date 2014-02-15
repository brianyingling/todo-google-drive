# == Schema Information
#
# Table name: o_auth_accounts
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  oauth_expires :datetime
#  oauth_token   :string(255)
#  provider      :string(255)
#  uid           :string(255)
#  username      :string(255)
#  oauth_secret  :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

# Represents an oauth-based account (.e.g. Facebook, Twitter, Google)
class OAuthAccount < ActiveRecord::Base
  belongs_to :user

  attr_accessible :user_id, :oauth_expires, :oauth_token, :provider, :uid, :username, :oauth_secret

end
