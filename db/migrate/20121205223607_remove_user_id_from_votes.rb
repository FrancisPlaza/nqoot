class RemoveUserIdFromVotes < ActiveRecord::Migration
  def up
    remove_column :votes, :user_id
  end

  def down
    add_column :votes, :user_id, :integer
  end
end
