class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string      :title
      t.text        :description
      t.datetime    :date_created
      t.datetime    :date_due
      t.boolean     :is_complete
      t.integer     :user_id
      t.timestamps
    end
  end
end
