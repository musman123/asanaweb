class AddProjectNameToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :project_name, :string
  end
end
