class AddIsStaffToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_staff, :boolean
  end
end
