class AddAllCommentsToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :all_comments, :string
  end
end
