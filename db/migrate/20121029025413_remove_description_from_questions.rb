class RemoveDescriptionFromQuestions < ActiveRecord::Migration
  def up
    remove_column :questions, :description
  end

  def down
    add_column :questions, :description, :string
  end
end
