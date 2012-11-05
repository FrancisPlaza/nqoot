class AddIsStaffEndorsedToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :is_staff_endorsed, :boolean
  end
end
