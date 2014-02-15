class CreateOAuthAccounts < ActiveRecord::Migration
  def change
    create_table :o_auth_accounts do |t|
      t.integer   :user_id
      t.datetime  :oauth_expires
      t.string    :oauth_token
      t.string    :provider
      t.string    :uid 
      t.string    :username
      t.string    :oauth_secret    
      t.timestamps
    end
  end
end
