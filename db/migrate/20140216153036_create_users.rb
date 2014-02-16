class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string    :first_name
      t.string    :last_name
      t.string    :email
      t.string    :provider
      t.string    :uid
      t.string    :image
      t.string    :token
      t.timestamps
    end
  end
end
