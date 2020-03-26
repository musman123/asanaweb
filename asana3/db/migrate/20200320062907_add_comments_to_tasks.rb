class AddCommentsToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :comments, :string
  end
end
