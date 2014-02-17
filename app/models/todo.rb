# == Schema Information
#
# Table name: todos
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  description  :text
#  date_created :datetime
#  date_due     :datetime
#  is_complete  :boolean
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Todo < ActiveRecord::Base
  belongs_to      :user
  attr_accessible :title, :description, :date_created, :date_due, :is_complete
end
