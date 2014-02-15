class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string      :gmail_address
      t.string      :password_digest
      t.timestamps
    end
  end
end
