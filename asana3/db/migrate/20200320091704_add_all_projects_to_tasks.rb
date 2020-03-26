class AddAllProjectsToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :all_project, :string
  end
end
